'use strict';

describe('module: main, controller: InstagramCtrl', function(){
  // load the controller's module
  beforeEach(module('main'));
  // load all the templates to prevent unexpected $http requests from ui-router
  // beforeEach(module('ngHtml2Js'));
  // instantiate controller
  var InstagramCtrl, scope;
  beforeEach(inject(function($controller, $rootScope){
    scope = $rootScope.$new();
    InstagramCtrl = $controller('InstagramCtrl', { '$scope': scope });
  }));

  it('should do something', function(){
    expect(!!InstagramCtrl).toBe(true);
  });

});
