angular.module("app").controller("LocationHotelController", [
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
        $scope.lowerprice = 100;
        $scope.higherprice = 100000;
        $scope.RoomNo = [1, 2, 3, 4, 5];
        $scope.SelectedAdultNo = 1;
        $scope.AdultNo = [1, 2, 3, 4];
        $scope.SelectedChildNo = 1;
        $scope.ChildNo = [1, 2, 3, 4];
        $scope.Package = {};
        function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }
        var getLocation = function () {
            gridBlock.start();
            $http.get("http://localhost:51050/api/LocationHotels/" + getParameterByName("id")).then(successCallback, errorCallback);
            function successCallback(response) {
                $scope.Package = response.data;
                console.log($scope.Package.length);
                gridBlock.stop();
            }
            function errorCallback() {
                gridBlock.stop();
            }
        }
        getLocation();
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
                $scope.firstHotels = $scope.hotels[0];
                gridBlock.stop();
            }
            function errorCallback() {
                gridBlock.stop();
            }
        }
        getHotels();
        $scope.showprice = function () {
            console.log($scope.lowerprice);
            console.log($scope.higherprice);
        };
    }
]);