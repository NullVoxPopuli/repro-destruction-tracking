'use strict';

const EmberApp = require('ember-cli/lib/broccoli/ember-app');
const { maybeEmbroider } = require('@embroider/test-setup');

module.exports = function (defaults) {
  let app = new EmberApp(defaults, {});

  if (process.env.CLASSIC) {
    return app.toTree();
  }

  return maybeEmbroider(app);
};
