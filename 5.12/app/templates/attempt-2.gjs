import Route from 'ember-route-template';
import { Labelled } from './components/labelled';

import Component from '@glimmer/component';

class Demo extends Component {
  <template>
    <Labelled @name="Demo">
      todo
    </Labelled>
  </template>
}
export default Route(Demo);
