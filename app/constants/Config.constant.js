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
    'googleApiUrl': 'https://maps.googleapis.com/maps/api/geocode/json?address=',
    'googleApiJsKey': 'AIzaSyA5EciOz3qsV5Gvy4EiLOqvjLu4TvfWLmE',
    'clientInstagramID': 'a2b4e3e7da704010a5d87416baec426e',
    'twitterClientID': '7T4s0Jn3OuVC9VVbh7DT2xKY1',
    'twitterClientSecret': 'URe94uJ6MZIMr6vHsPWOhUtX2uJlYr8cfMZWU2xda1cElTWhna'
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
