'use strict';

angular.module('todo')
  .controller('NavigationCtrl', function ($scope, $location) {

    $scope.isActive = function(path) {
      return path === $location.path();
    };

  });
