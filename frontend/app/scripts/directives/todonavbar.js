'use strict';

angular.module('todo').directive('todonavbar', function() {
  return {
    restrict: 'E',
    templateUrl: 'views/todonavbar.html',
    controller: 'NavigationCtrl'
  };
});