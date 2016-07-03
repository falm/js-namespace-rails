
module ActionView::Helpers::AssetTagHelper

  alias_method :javascript_include_tag_without_controller, :javascript_include_tag

  def javascript_include_tag(*source)

    if defined?(controller_path) && !@_included
      @_included = true
      concat javascript_tag(insert_hook_script, defer: 'defer')
    end
    javascript_include_tag_without_controller(*source)
  end

end
