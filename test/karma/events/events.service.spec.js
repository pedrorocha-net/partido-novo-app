'use strict';

describe('module: main, service: EventsFactory', function(){
  // load the service's module
  beforeEach(module('main'));
  // load all the templates to prevent unexpected $http requests from ui-router
  // beforeEach(module('ngHtml2Js'));
  // instantiate service
  var EventsFactory;
  beforeEach(inject(function(_EventsFactory_){
    EventsFactory = _EventsFactory_;
  }));

  it('should do something', function(){
    expect(!!EventsFactory).toBe(true);
  });

});
