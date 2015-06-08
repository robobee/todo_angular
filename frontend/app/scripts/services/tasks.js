'use strict';

angular.module('todo').factory('tasks', function($resource) {
  return $resource('/api/tasks');
});