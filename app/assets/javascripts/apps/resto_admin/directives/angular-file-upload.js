var baseUrl = 'http localhost:port'; // fill in as needed

angular.module('uploadFile', ['MenuItemServices']) // using restangular is optional

.directive('uploadImage', function () {
return {
 restrict: 'A',
 link: function (scope, elem, attrs) {
  var reader = new FileReader();
  reader.onload = function (e) {
    // retrieves the image data from the reader.readAsBinaryString method and stores as data
    // calls the uploadImage method, which does a post or put request to server
    scope.item.imageData = btoa(e.target.result);
    // scope.uploadImage(scope.item.imagePath);
    // updates scope
    // scope.$apply();
    console.log(scope.item)
  };

  // listens on change event
  elem.on('change', function() {
    var file = elem[0].files[0];
    // gathers file data (filename and type) to send in json
    scope.item.imageContent = file.type;
    scope.item.imagePath = file.name;
    // updates scope; not sure if this is needed here, I can not remember with the testing I did...and I do not quite understand the apply method that well, as I have read limited documentation on it.
    // scope.$apply();
    // converts file to binary string
    reader.readAsBinaryString(file);
  });
 }
};
});