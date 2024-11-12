import Route from 'ember-route-template';
import { pageTitle } from 'ember-page-title';

export default Route(
  <template>
    {{pageTitle "Autotracked Destruction (bad)"}}

    <nav>
      <a href="/attempt-1">Attempt 1</a>
      <a href="/attempt-2">Attempt 2</a>
    </nav>

    {{outlet}}
  </template>
);
