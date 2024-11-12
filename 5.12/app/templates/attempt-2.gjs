import Route from 'ember-route-template';
import { Labelled } from './components/labelled';
import { tracked } from '@glimmer/tracking';
import { on } from '@ember/modifier';

import EmberComponent from '@ember/component';
import Component from '@glimmer/component';

class Child extends EmberComponent {
  willDestroyElement() {
    super.willDestroyElement();
    this.incrementWillDestroy();
  }

  <template>
    <Labelled @name="Child">
      <p>Child Rendered</p>
    </Labelled>
  </template>
}

class Example extends EmberComponent {
  @tracked showChild = true;

  toggleChild = () => {
    this.showChild = !this.showChild;
  };

  <template>
    <Labelled @name="Example">
      <p>willDestroyCalls: {{this.willDestroyCalls}}</p>
      <button {{on "click" this.toggleChild}}>Toggle child</button>

      {{#if this.showChild}}
        <Child @incrementWillDestroy={{this.incrementWillDestroy}} />
      {{/if}}
    </Labelled>
  </template>
}

// Repro from
// https://github.com/tamil-arasu849/ember-lifecycle-hook-bug-repo/blob/main/app/templates/application.hbs
class Demo extends Component {
  @tracked willDestroyCalls = 0;

  increment = () => this.willDestroyCalls++;

  <template>
    <Labelled @name="Demo">
      <Example
        @incrementWillDestroy={{this.increment}}
        @willDestroyCalls={{this.willDestroyCalls}}
      />
    </Labelled>
  </template>
}
export default Route(Demo);
