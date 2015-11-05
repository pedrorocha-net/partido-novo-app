'use strict';

(function(){
  angular.module('app')
  .constant('Config', {
      // gulp environment: injects environment vars
    // https://github.com/mwaylabs/generator-m-ionic#gulp-environment
    ENV: {
      /*inject-env*/
      'SERVER_URL': 'https://DEVSERVER/api'
      /*endinject*/
    },
    // gulp build-vars: injects build vars
    // https://github.com/mwaylabs/generator-m-ionic#gulp-build-vars
    BUILD: {
      /*inject-build*/
      /*endinject*/
    }
  });

})();
