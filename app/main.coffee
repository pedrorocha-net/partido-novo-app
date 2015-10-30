'use strict'
angular.module('main', [
  'ionic'
  'ionic-material'
  'ngCordova'
  'ui.router'
]).config ($stateProvider, $urlRouterProvider, $httpProvider) ->

  $urlRouterProvider.otherwise '/events/list'

  $stateProvider.state 'events',
    url: '/events'
    abstract: true
    templateUrl: 'templates/tabs.html'
  .state 'events.list',
    url: '/list'
    views: 'tab-list':
      templateUrl: 'templates/events/list.html'
      controller: 'eventsCtrl as vm'
  .state 'events.listDetail',
    url: '/list/detail/:id'
    views: 'tab-list':
      templateUrl: 'templates/list-detail.html'
  .state 'events.about',
    url: '/about'
    views: 'tab-debug':
      templateUrl: 'templates/about/about.html'

  $httpProvider.defaults.useXDomain = true;
  delete $httpProvider.defaults.headers.common['X-Requested-With'];

