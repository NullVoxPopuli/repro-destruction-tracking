import Route from 'ember-route-template';
import { pageTitle } from 'ember-page-title';

export default Route(
  <template>
    {{pageTitle "Autotracked Destruction (bad)"}}

    <nav style="display: flex; gap: 1rem;">
      <a href="/attempt-1">Autosave triggers infinite render protection</a>
      <a href="/attempt-2">Attempt 2</a>
    </nav>

    {{outlet}}
  </template>
);
