'use strict';

describe('module: main, controller: TwitterCtrl', function(){
  // load the controller's module
  beforeEach(module('main'));
  // load all the templates to prevent unexpected $http requests from ui-router
  // beforeEach(module('ngHtml2Js'));
  // instantiate controller
  var TwitterCtrl, scope;
  beforeEach(inject(function($controller, $rootScope){
    scope = $rootScope.$new();
    TwitterCtrl = $controller('TwitterCtrl', { '$scope': scope });
  }));

  it('should do something', function(){
    expect(!!TwitterCtrl).toBe(true);
  });

});
