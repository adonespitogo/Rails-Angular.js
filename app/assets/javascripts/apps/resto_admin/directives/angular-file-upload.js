var baseUrl = 'http localhost:port'; // fill in as needed

angular.module('uploadFile', ['MenuItemServices']) // using restangular is optional

.directive('uploadImage', function () {
return {
  restrict: 'EA',
  scope: {
    model: '=imageSrc',
    output: '=imageOutput'
  },
  template: '<input type="file" id="fileUploadInput" ng-show="false"/>'+
            '<img ng-src="data:{{imageContent}};base64,{{imagePreview}}" ng-if="imagePreview" title="Click to add image." ng-click="openFileWindow()" class="img-responsive"/>' +
            '<img ng-if="!imagePreview" title="Click to add image." class="img-responsive" ng-src="{{model}}" ng-click="openFileWindow()" ng-class="{ hidden: !model}" >'+
            '<div class="btn btn-default" ng-click="openFileWindow()" ng-class=" {hidden: model||imagePreview}">Click to add an image.</div>',

  link: function (scope, elem, attrs) {

    var inputElem = angular.element('#fileUploadInput');
    // triggers click event for input file, causing the file selection window to open
    scope.openFileWindow = function(){
      inputElem.trigger('click');
    }

    scope.readerOnload = function(e){
      var imageData = btoa(e.target.result);
      scope.imagePreview = imageData
      scope.output = {
        imageContent: scope.imageContent,
        imagePath: scope.imagePath,
        imageData: imageData
      }
      scope.$apply()
    }



    var reader = new FileReader();
    reader.onload = scope.readerOnload

    // listens on change event
    inputElem.on('change', function() {
      var file = inputElem[0].files[0];
      // gathers file data (filename and type) to send in json
      scope.imageContent = file.type;
      scope.imagePath = file.name;
      // converts file to binary string
      reader.readAsBinaryString(file);
    });
  }
};
});