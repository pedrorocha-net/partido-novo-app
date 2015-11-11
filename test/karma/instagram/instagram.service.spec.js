'use strict';

describe('module: main, service: InstagramFactory', function(){
  // load the service's module
  beforeEach(module('main'));
  // load all the templates to prevent unexpected $http requests from ui-router
  // beforeEach(module('ngHtml2Js'));
  // instantiate service
  var InstagramFactory;
  beforeEach(inject(function(_InstagramFactory_){
    InstagramFactory = _InstagramFactory_;
  }));

  it('should do something', function(){
    expect(!!InstagramFactory).toBe(true);
  });

});
