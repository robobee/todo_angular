'use strict';

angular.module('todo').factory('Tasks', function($resource) {
  return $resource('/api/tasks/:id', {id: '@id'},
    {
      'update': { method: 'PATCH' }
    });
});
