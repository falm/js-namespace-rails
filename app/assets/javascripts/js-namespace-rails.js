
(function($, win){

  'use strict';

  function JsNamespace(){

    var self = this;

    self.INIT = 'init';

    self.PARAMS_CONTAINER = '.executive-isolation-params';

    self.controllerList = {};

    self.on = function(controllerName, obj){
      self.controllerList[controllerName] = obj;
    };

    self.params = {};

    self.fetchParams = function(){
      return self.params;
    };

    self.setInit = function(controllerName, actionName){
      var $body = $('body');
      $body.attr('data-controller', controllerName);
      $body.attr('data-action', actionName);
    };

    self.init = function(controllerName, actionName){

      var params = [self.fetchParams()];

      var activeController = self.controllerList[controllerName];

      if( activeController !== undefined && typeof  activeController === 'object') {

        if(activeController[self.INIT] !== undefined && typeof activeController[self.INIT] === 'function'){
          activeController.init(params);
        }

        if(activeController[actionName] !== undefined && typeof activeController[actionName] === 'function'){
          activeController[actionName].apply(null, params);
        }
      }
    }
  }

  var jsNamespace = new JsNamespace();

  $(document).ready(function(){

    var $body = $('body');

    var controllerName = $body.data('controller');

    var actionName = $body.data('action');

    jsNamespace.init(controllerName, actionName)

  });

  win.JsSpace = jsNamespace;

})(jQuery, this);
