import Route from 'ember-route-template';
import { pageTitle } from 'ember-page-title';

export default Route(
  <template>
    {{pageTitle "5.5 -> 5.6+ Regression Demos"}}

    <nav style="display: grid; gap: 1rem;">
      <ul>
        <li>
          <a href="/attempt-1">Autosave triggers infinite render protection
            (error is correct)</a></li>
        <li><a href="/attempt-2">Autotracked destruction (bug, shouldn't happen)</a></li>
      </ul>
    </nav>
    <hr />

    {{outlet}}
  </template>
);
