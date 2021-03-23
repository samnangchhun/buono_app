const { resolve } = require('path');
const { config, environment, Environment } = require('@rails/webpacker');

const webpack = require('webpack');
const WebpackerPwa = require('webpacker-pwa');
// Preventing Babel from transpiling NodeModules packages
environment.loaders.delete('nodeModules');
// Bootstrap 4 has a dependency over jQuery & Popper.js:
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
);

new WebpackerPwa(config, environment);
module.exports = environment;
