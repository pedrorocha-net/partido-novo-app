'use strict';

(function(){
  angular.module('app')
  .constant('Config', {
      // gulp environment: injects environment vars
    // https://github.com/mwaylabs/generator-m-ionic#gulp-environment
    ENV: {
      /*eslint-disable */
      /*inject-env*/
      'api_eventosURl': 'http://dev-partido-novo-app.pantheon.io/api/1/eventos/proximos',
    'googleApiUrl': 'https://maps.googleapis.com/maps/api/geocode/json?address='
      /*endinject*/
      /*eslint-enable */
    },
    // gulp build-vars: injects build vars
    // https://github.com/mwaylabs/generator-m-ionic#gulp-build-vars
    BUILD: {
      /*inject-build*/
      /*endinject*/
    }
  });

})();
