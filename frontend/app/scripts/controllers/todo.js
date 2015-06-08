'use strict';

angular.module('todo')
  .controller('TodoCtrl', function ($scope, tasks) {
    $scope.tasks = tasks.query();

    $scope.todo = {
      newTask: ''
    };

    $scope.addTask = function() {
      $scope.tasks.unshift($scope.todo.newTask);
      $scope.todo.newTask = ''
    };

  });
