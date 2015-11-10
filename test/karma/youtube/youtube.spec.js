'use strict';

describe('module: main, controller: YoutubeCtrl', function(){
  // load the controller's module
  beforeEach(module('main'));
  // load all the templates to prevent unexpected $http requests from ui-router
  // beforeEach(module('ngHtml2Js'));
  // instantiate controller
  var YoutubeCtrl, scope;
  beforeEach(inject(function($controller, $rootScope){
    scope = $rootScope.$new();
    YoutubeCtrl = $controller('YoutubeCtrl', { '$scope': scope });
  }));

  it('should do something', function(){
    expect(!!YoutubeCtrl).toBe(true);
  });

});
