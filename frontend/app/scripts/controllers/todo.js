'use strict';

angular.module('todo')
  .controller('TodoCtrl', function ($scope, tasks, $resource) {

    $scope.tasks = tasks.query();

    $scope.newTask = {
      description: ''
    };

    $scope.addTask = function() {
      $scope.tasks.unshift($scope.newTask);
      $scope.newTask = {
        description: ''
      };
    };

  });
