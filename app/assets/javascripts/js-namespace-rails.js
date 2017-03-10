
(function(win){

  'use strict';

  function JsNamespace(){

    var self = this;

    self.INIT = 'init';

    self.RESERVE = ['new'];

    self.controllerList = {};

    self.on = function(controllerName, obj){
      self.controllerList[controllerName] = obj;
    };

    self.params = {};

    self.fetchParams = function(){
      return self.params;
    };

    self.init = function(controllerName, actionName){

      var params = self.fetchParams();

      var activeController = self.controllerList[controllerName];

      if( activeController !== undefined && typeof  activeController === 'object') {

        activeController.params = params;

        if(activeController[self.INIT] !== undefined && typeof activeController[self.INIT] === 'function'){
          activeController.init(params);
        }

        if(activeController[actionName] !== undefined && typeof activeController[actionName] === 'function'){
          activeController[actionName].call(activeController, params);
        } else if ( self.RESERVE.indexOf(actionName) >= 0 && activeController['_' + actionName] !== undefined) {
          activeController['_' + actionName].call(activeController, params);
        }
      }
    };

    self.ready = function(fn){
      if ( typeof fn !== 'function' ) return;

      if ( document.readyState === 'complete'  ) {
        return fn();
      }

      document.addEventListener( 'interactive', fn, false );
    }
  }

  var jsNamespace = new JsNamespace();

  document.addEventListener('DOMContentLoaded', function(){

    var $body = document.querySelector('body');

    var controllerName = $body.getAttribute('data-controller');

    var actionName = $body.getAttribute('data-action');

    jsNamespace.init(controllerName, actionName)

  });

  win.JsSpace = jsNamespace;

})(this);
