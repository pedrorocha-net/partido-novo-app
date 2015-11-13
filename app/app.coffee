'use strict'
angular.module('app', [
  'ionic'
  'ionic-material'
  'ngCordova'
  'ui.router'
  'ngTwitter'
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
  .state 'instagram',
    url: '/instagram'
    abstract: true
    templateUrl: 'templates/menu.html'
  .state 'instagram.list',
    url: '/list'
    views: 'pageContent':
      templateUrl: 'templates/instagram/list.html'
      controller: 'instagramCtrl as vm'
  .state 'twitter',
    url: '/twitter'
    abstract: true
    templateUrl: 'templates/menu.html'
  .state 'twitter.list',
    url: '/list'
    views: 'pageContent':
      templateUrl: 'templates/twitter/list.html'
      controller: 'twitterCtrl as vm'
  .state 'clipping',
    url: '/clipping'
    abstract: true
    templateUrl: 'templates/menu.html'
  .state 'clipping.list',
    url: '/list'
    views: 'pageContent':
      templateUrl: 'templates/clipping/list.html'
      controller: 'clippingCtrl as vm'

  $httpProvider.defaults.useXDomain = true;
  delete $httpProvider.defaults.headers.common['X-Requested-With'];
