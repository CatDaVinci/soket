angular.module('chat', [])
  .controller('chatCtrl', function($scope, $http){
    var dispatcher = new WebSocketRails('localhost:3000/websocket');
    var channel = dispatcher.subscribe('chat');
    $scope.messageByFirst = '';
    $scope.messageBySecond = '';
    $scope.messageByThird = '';
    $scope.messages = [];
    $scope.sendFirst = function() {
      var newMessage = {};
      newMessage.message = {};
      newMessage.message.body = $scope.messageByFirst;
      newMessage.message.user_id = 1;
      $http.post('api/v1/users/1/messages', newMessage).success(function(data){
      });
      $scope.messageByFirst = '';
    };
    $scope.sendSecond = function() {
      var newMessage = {};
      newMessage.message = {};
      newMessage.message.body = $scope.messageBySecond;
      newMessage.message.user_id = 2;
      $http.post('api/v1/users/2/messages', newMessage).success(function(data){
      });
      $scope.messageByFirst = '';
    };
    $scope.sendThird = function() {
      var newMessage = {};
      newMessage.message = {};
      newMessage.message.body = $scope.messageByThird;
      newMessage.message.user_id = 3;
      $http.post('api/v1/users/3/messages', newMessage).success(function(data){
      });
      $scope.messageByThird = '';
    };
    channel.bind('message.new', function(data){
      $scope.messages.push(JSON.parse(data));
      $scope.$applyAsync();
    });
  });