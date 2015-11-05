'use strict'
angular.module('app', [
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
      templateUrl: 'templates/events/event-detail.html'
      controller: 'eventsCtrl as vm'
  .state 'events.about',
    url: '/about'
    views: 'tab-debug':
      templateUrl: 'templates/about/about.html'
  .state 'events.location',
    url: '/location'
    views: 'tab-debug':
      templateUrl: 'templates/map.html'
      controller: 'eventsCtrl as vm'

  $httpProvider.defaults.useXDomain = true;
  delete $httpProvider.defaults.headers.common['X-Requested-With'];
