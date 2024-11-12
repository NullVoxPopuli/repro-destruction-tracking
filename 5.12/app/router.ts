import EmberRouter from '@ember/routing/router';
import config from 'repro-destruction-tracking/config/environment';

import { properLinks } from 'ember-primitives/proper-links';

@properLinks
export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  this.route('attempt-1');
  this.route('attempt-2');
});
