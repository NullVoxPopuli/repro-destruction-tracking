import Route from 'ember-route-template';
import type { TOC } from '@ember/component/template-only';
import { pageTitle } from 'ember-page-title';
import Component from '@glimmer/component';
// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-expect-error
import { localCopy } from 'tracked-toolbox';
import { on } from '@ember/modifier';
import { fn } from '@ember/helper';
import { tracked } from '@glimmer/tracking';
import { TrackedArray } from 'tracked-built-ins';

const Labelled = <template>
  <fieldset><legend>{{@name}}</legend>
    {{yield}}
  </fieldset>
</template> satisfies TOC<{ Args: { name: string }; Blocks: { default: [] } }>;

class Item extends Component<{ value: number; onChange: (n: number) => void }> {
  @localCopy('args.value') declare value: number;
  increment = () => this.value++;

  @tracked enableAutosave = false;
  toggleAutosave = () => (this.enableAutosave = !this.enableAutosave);
  autosave = () => {
    if (this.value !== this.args.value) {
      this.args.onChange(this.value);
    }
  };

  <template>
    <Labelled @name="Item">
      @value:
      {{@value}}, this.value:
      {{this.value}}
      <button {{on "click" this.increment}}>++</button>
      &nbsp;&nbsp;|&nbsp;&nbsp;
      <label>
        Toggle Autosave (Currently:
        {{this.enableAutosave}})
        <input type="checkbox" {{on "input" this.toggleAutosave}} />
      </label>

      {{#if this.enableAutosave}}
        {{(this.autosave)}}
      {{/if}}
    </Labelled>
  </template>
}

class Inner extends Component<{ collection: number[] }> {
  @localCopy('args.collection') declare collection: number[];

  addItem = () => this.collection.push(this.collection.length + 1);
  replace = () => (this.collection = new TrackedArray([1, 2, 3]));

  get state() {
    return JSON.stringify({ collection: this.collection }, null, 2);
  }

  handleChange = (index: number, nextValue: number) => {
    this.collection[index] = nextValue;
  };

  <template>
    <Labelled @name="Inner">
      <button {{on "click" this.addItem}}>add item</button>
      <button {{on "click" this.replace}}>replace items</button>
      <pre>{{this.state}}</pre>

      {{#each this.collection as |item i|}}
        <Item @value={{item}} @onChange={{fn this.handleChange i}} />
      {{/each}}
    </Labelled>
  </template>
}

class Demo extends Component {
  @tracked cond = false;
  flip = () => (this.cond = !this.cond);

  @tracked collection = new TrackedArray([1, 2]);
  addItem = () => this.collection.push(this.collection.length + 1);
  replace = () => (this.collection = new TrackedArray([1, 2, 3]));

  get state() {
    return JSON.stringify(
      { cond: this.cond, collection: this.collection },
      null,
      2
    );
  }

  handleChange = (index: number, nextValue: number) => {
    this.collection[index] = nextValue;
  };

  <template>
    <Labelled @name="Demo">
      <button {{on "click" this.flip}}>toggle vis</button>
      <button {{on "click" this.addItem}}>add item</button>
      <button {{on "click" this.replace}}>replace items</button>

      <pre>{{this.state}}</pre>
      {{#each this.collection as |item i|}}
        <Item @value={{item}} @onChange={{fn this.handleChange i}} />
      {{/each}}

      {{#if this.cond}}
        <Inner @collection={{this.collection}} />
      {{/if}}
    </Labelled>
  </template>
}

export default Route(
  <template>
    {{pageTitle "Autotracked Destruction (bad)"}}

    <Demo />
  </template>
);
