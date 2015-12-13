
module ActionView::Helpers::AssetTagHelper

  alias_method :old_javascript_include_tag, :javascript_include_tag

  def javascript_include_tag(*source)

    origin_result = old_javascript_include_tag(*source)

    _controller = controller_path.gsub(/\//,'_')

    script = <<STRING
      document.addEventListener('DOMContentLoaded', function() {
        document.getElementsByTagName('body')[0].setAttribute('data-controller', '#{_controller}');
        document.getElementsByTagName('body')[0].setAttribute('data-action', '#{action_name}');
      });
STRING
    origin_result + concat(javascript_tag(script, defer: 'defer'))

  end

end