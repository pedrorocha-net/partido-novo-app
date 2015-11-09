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
    views: 'tab-events':
      templateUrl: 'templates/events/list.html'
      controller: 'eventsCtrl as vm'
  .state 'events.listDetail',
    url: '/list/detail/:id'
    views: 'tab-events':
      templateUrl: 'templates/events/event-detail.html'
      controller: 'eventsCtrl as vm'
  .state 'events.about',
    url: '/about'
    views: 'tab-about':
      templateUrl: 'templates/about/about.html'
  .state 'events.location',
    url: '/location'
    views: 'tab-about':
      templateUrl: 'templates/map.html'
      controller: 'eventsCtrl as vm'
  .state 'videos',
    url: '/videos'
    abstract: true
    templateUrl: 'templates/tabs.html'
  .state 'videos.list',
    url: '/list'
    views: 'tab-video':
      templateUrl: 'templates/videos/list.html'

  $httpProvider.defaults.useXDomain = true;
  delete $httpProvider.defaults.headers.common['X-Requested-With'];
