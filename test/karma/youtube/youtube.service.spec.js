'use strict';

describe('module: main, service: YoutubeFactory', function(){
  // load the service's module
  beforeEach(module('main'));
  // load all the templates to prevent unexpected $http requests from ui-router
  // beforeEach(module('ngHtml2Js'));
  // instantiate service
  var YoutubeFactory;
  beforeEach(inject(function(_YoutubeFactory_){
    YoutubeFactory = _YoutubeFactory_;
  }));

  it('should do something', function(){
    expect(!!YoutubeFactory).toBe(true);
  });

});
