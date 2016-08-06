
module JsNamespaceRails
  module ActionControllerExtension

    def self.included(base)
      base.module_eval do
        helper_method :js_execute
        helper_method :insert_hook_script
      end
    end

    def js(params)
      @js_namespace_rails_params ||= {}
      @js_namespace_rails_params = @js_namespace_rails_params.merge(params)
    end

    def js_execute
      view_context.render(partial: 'js_namespace_rails/init.js.erb')
    end

    def insert_hook_script
      view_context.render(partial: 'js_namespace_rails/hook.js.erb')
    end
  end
  ::ActionController::Base.send :include, ActionControllerExtension
end
