
module JsNamespaceRails
  module ActionControllerExtension
    def js(params)
      @js_namespace_rails_params ||= {}
      @js_namespace_rails_params.merge!(params)
    end
  end
  ::ActionController::Base.send :include, ActionControllerExtension
end
