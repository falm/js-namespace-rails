
(function($, win){

  'use strict';

  function JsNamespace(){

    var self = this;

    self.INIT = 'init';

    self.PARAMS_CONTAINER = '.executive-isolation-params';

    self.contrllerList = {};

    self.on = function(controllerName, obj){
      self.contrllerList[controllerName] = obj;
    };

    self.fetchParams = function(){
      var out_options = {};
      $(self.PARAMS_CONTAINER).each(function(i, ele){
        var options = $(ele).data('options');
        if(options){
          out_options = $.extend(out_options, options);
        }
      });
      return out_options;
    };

    self.init = function(controllerName, actionName){

      var params = [self.fetchParams()];

      var activeController = self.contrllerList[controllerName];

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

})($, this);