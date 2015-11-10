'use strict'
angular.module('app', [
  'ionic'
  'ionic-material'
  'ngCordova'
  'ui.router'
]).config ($stateProvider, $urlRouterProvider, $httpProvider) ->

  $urlRouterProvider.otherwise '/about/partidonovo'

  $stateProvider.state 'events',
    url: '/events'
    abstract: true
    templateUrl: 'templates/menu.html'
  .state 'events.list',
    url: '/list'
    views: 'pageContent':
      templateUrl: 'templates/events/list.html'
      controller: 'eventsCtrl as vm'
  .state 'events.listDetail',
    url: '/list/detail/:id'
    views: 'pageContent':
      templateUrl: 'templates/events/event-detail.html'
      controller: 'eventsCtrl as vm'
  .state 'events.location',
    url: '/location'
    views: 'pageContent':
      templateUrl: 'templates/map.html'
      controller: 'eventsCtrl as vm'
  .state 'about',
    url: '/about'
    abstract: true
    templateUrl: 'templates/menu.html'
  .state 'about.partidonovo',
    url: '/partidonovo'
    views: 'pageContent':
      templateUrl: 'templates/about/partidonovo.html'
  .state 'about.app',
    url: '/app'
    views: 'pageContent':
      templateUrl: 'templates/about/about.html'
  .state 'videos',
    url: '/videos'
    abstract: true
    templateUrl: 'templates/menu.html'
  .state 'videos.list',
    url: '/list'
    views: 'pageContent':
      templateUrl: 'templates/youtube/list.html'
      controller: 'youtubeCtrl as vm'

  $httpProvider.defaults.useXDomain = true;
  delete $httpProvider.defaults.headers.common['X-Requested-With'];
