'use strict';

describe('module: main, service: MainFactory', function(){
  // load the service's module
  beforeEach(module('main'));
  // load all the templates to prevent unexpected $http requests from ui-router
  // beforeEach(module('ngHtml2Js'));
  // instantiate service
  var MainFactory;
  beforeEach(inject(function(_MainFactory_){
    MainFactory = _MainFactory_;
  }));

  describe('.changeBriefly()', function(){
    beforeEach(function(){
      MainFactory.changeBriefly();
    });
    it('should briefly change', function(){
      expect(MainFactory.someData.binding).toEqual('Yeah this was changed');
    });
  });

});
