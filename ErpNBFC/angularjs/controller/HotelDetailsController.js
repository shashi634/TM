angular.module("app").controller("HotelDetailsController", [
    "$rootScope", "$scope", "blockUI", "$http","$location",
    function ($rootScope, $scope, blockUI, $http, $location) {
        var gridBlock = blockUI.instances.get('main');
        
        $scope.hotel = {};
        $scope.location = null;
        $scope.checkInDate = null;
        $scope.checkOutDate = null;
        $scope.selectedRoomNo = "--";
        $scope.selectedAdultNo = "--";
        $scope.selectedChildNo = "--";
        $scope.MainImage = "";
        function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }
        console.log(getParameterByName("id"));
        var GetHotel = function () {
            gridBlock.start();
            $http.get('http://localhost:51050/api/hotels/' + getParameterByName("id")).then(successCallback, errorCallback);
            function successCallback(response) {
                $scope.hotel = response.data;
                $scope.MainImage = "/p/images/" + $scope.hotel.Image[0];
                //HotelLocation("New Delhi");
                console.log($scope.hotel);
                gridBlock.stop();
                
            }
            function errorCallback(error) {
                gridBlock.stop();
            }
        }
        GetHotel();
        $scope.searchHotel = function () {
            console.log($scope.location);
            console.log($scope.checkInDate);
            console.log($scope.checkOutDate);
            console.log($scope.selectedRoom);

        }

        var HotelLocation = function ( place) {
            gridBlock.start();
            $http.get('http://maps.googleapis.com/maps/api/geocode/json?address=' + place + '&sensor=false').then(successCallback, errorCallback);
            function successCallback(response) {
                
                console.log(response);
                gridBlock.stop();

            }
            function errorCallback(error) {
                gridBlock.stop();
            }
        }
        
    }
]);