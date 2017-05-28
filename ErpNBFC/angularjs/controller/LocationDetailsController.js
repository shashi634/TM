angular.module("app").controller("LocationDetailsController", [
    "$rootScope", "$scope", "blockUI", "$http", "$location","$sce",
    function ($rootScope, $scope, blockUI, $http, $location, $sce) {
        var gridBlock = blockUI.instances.get('main');

        $scope.location = {};
        $scope.Package = {};
        $scope.location = null;
        $scope.checkInDate = null;
        $scope.checkOutDate = null;
        $scope.selectedRoomNo = "--";
        $scope.selectedAdultNo = "--";
        $scope.selectedChildNo = "--";
        $scope.MainImage = "";
        $scope.myContent = "";
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
        var GetLocation = function () {
            gridBlock.start();
            $http.get('http://localhost:51050/api/LocationDetails/' + getParameterByName("id")).then(successCallback, errorCallback);
            function successCallback(response) {
                $scope.location = response.data;
                $scope.MainImage = "/p/images/" + $scope.location.Images[0];
                $scope.myContent = $sce.trustAsHtml($scope.location.Description);
                console.log($scope.location);
                getHotelOfLocation($scope.location.LocationPublicId);
                gridBlock.stop();

            }
            function errorCallback(error) {
                gridBlock.stop();
            }
        }
        GetLocation();
        $scope.searchHotel = function () {
            console.log($scope.location);
            console.log($scope.checkInDate);
            console.log($scope.checkOutDate);
            console.log($scope.selectedRoom);

        }

        var HotelLocation = function (place) {
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
        var getHotelOfLocation = function (id) {
            gridBlock.start();
            $http.get("http://localhost:51050/api/LocationHotels/" + id).then(successCallback, errorCallback);
            function successCallback(response) {
                $scope.Package = response.data;
                console.log("-----###-------");
                console.log($scope.Package);
                gridBlock.stop();
            }
            function errorCallback() {
                gridBlock.stop();
            }
        }
        
    }
]);