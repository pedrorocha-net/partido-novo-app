'use strict';

describe('module: main, service: ClippingFactory', function(){
  // load the service's module
  beforeEach(module('main'));
  // load all the templates to prevent unexpected $http requests from ui-router
  // beforeEach(module('ngHtml2Js'));
  // instantiate service
  var ClippingFactory;
  beforeEach(inject(function(_ClippingFactory_){
    ClippingFactory = _ClippingFactory_;
  }));

  it('should do something', function(){
    expect(!!ClippingFactory).toBe(true);
  });

});
