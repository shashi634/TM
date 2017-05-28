angular.module("app").controller("HomePageController", [
    "$rootScope", "$scope", "blockUI", "$http", 
    function ($rootScope, $scope, blockUi, $http) {
        var gridBlock = blockUi.instances.get('main');
       
        $scope.locationData = {};
        $scope.hotels = [];
        $scope.firstHotels = [];
        $scope.location = null;
        $scope.checkInDate = null;
        $scope.checkOutDate = null;
        $scope.SelectedRoomNo = 1;
        $scope.RoomNo = [1,2,3,4,5];
        $scope.SelectedAdultNo = 1;
        $scope.AdultNo = [1, 2, 3, 4];
        $scope.SelectedChildNo = 1;
        $scope.ChildNo = [1,2,3,4];
        $scope.searchParam={};
        $scope.searchParam.City=null;
        $scope.searchParam.Country=null;
        $scope.getLocation = function () {
            console.log($scope.searchParam);
            gridBlock.start();
            $http.post("http://localhost:51050/api/SearchLocation", $scope.searchParam).then(successCallback, errorCallback);
            function successCallback(response) {
                $scope.locationData = response.data;
                console.log($scope.locationData);
                gridBlock.stop();
            }
            function errorCallback() {
                gridBlock.stop();
            }
        }
        $scope.getLocation();
        $scope.searchHotel = function () {
            console.log($scope.location);
            console.log($scope.checkInDate);
            console.log($scope.checkOutDate);
            console.log($scope.SelectedRoomNo);
            console.log($scope.SelectedAdultNo);
            console.log($scope.SelectedChildNo);
        }
        $scope.RatingArray = [];
        var getHotels = function () {
            gridBlock.start();
            $http.get('http://localhost:51050/api/Hotels').then(successCallback, errorCallback);
            function successCallback(response) {
                $scope.hotels = response.data;
                $scope.firstHotels =$scope.hotels[0];
                gridBlock.stop();
            }
            function errorCallback() {
                gridBlock.stop();
            }
        }
        getHotels();
    }
]);