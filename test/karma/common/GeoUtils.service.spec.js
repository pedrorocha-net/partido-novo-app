'use strict';

describe('module: main, service: GeoUtilsFactory', function(){
  // load the service's module
  beforeEach(module('main'));
  // load all the templates to prevent unexpected $http requests from ui-router
  // beforeEach(module('ngHtml2Js'));
  // instantiate service
  var GeoUtilsFactory;
  beforeEach(inject(function(_GeoUtilsFactory_){
    GeoUtilsFactory = _GeoUtilsFactory_;
  }));

  it('should do something', function(){
    expect(!!GeoUtilsFactory).toBe(true);
  });

});
