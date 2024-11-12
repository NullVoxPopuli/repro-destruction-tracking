import Route from 'ember-route-template';
import { pageTitle } from 'ember-page-title';

export default Route(
  <template>
    {{pageTitle "5.5 -> 5.6+ Regression Demos"}}

    <nav style="display: flex; gap: 1rem;">
      <a href="/attempt-1">Autosave triggers infinite render protection</a>
      <a href="/attempt-2">Autotracked destruction (bad)</a>
    </nav>

    {{outlet}}
  </template>
);
