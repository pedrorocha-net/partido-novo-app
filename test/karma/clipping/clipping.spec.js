'use strict';

describe('module: main, controller: ClippingCtrl', function(){
  // load the controller's module
  beforeEach(module('main'));
  // load all the templates to prevent unexpected $http requests from ui-router
  // beforeEach(module('ngHtml2Js'));
  // instantiate controller
  var ClippingCtrl, scope;
  beforeEach(inject(function($controller, $rootScope){
    scope = $rootScope.$new();
    ClippingCtrl = $controller('ClippingCtrl', { '$scope': scope });
  }));

  it('should do something', function(){
    expect(!!ClippingCtrl).toBe(true);
  });

});
