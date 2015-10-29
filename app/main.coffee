'use strict'
angular.module('main', [
  'ionic'
  'ionic-material'
  'ngCordova'
  'ui.router'
]).config ($stateProvider, $urlRouterProvider) ->

  $urlRouterProvider.otherwise '/events/list'

  $stateProvider.state 'events',
    url: '/events'
    abstract: true
    templateUrl: 'templates/tabs.html'
  .state 'events.list',
    url: '/list'
    views: 'tab-list':
      templateUrl: 'templates/list.html'
  .state 'events.listDetail',
    url: '/list/detail'
    views: 'tab-list':
      templateUrl: 'templates/list-detail.html'
  .state 'events.about',
    url: '/about'
    views: 'tab-debug':
      templateUrl: 'templates/about/about.html'

