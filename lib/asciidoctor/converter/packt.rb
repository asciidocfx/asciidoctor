module Asciidoctor

  class Converter::PacktConverter < Converter::Base
    def convert node, template_name = nil, opts = {}
      backend = node.document.attributes['backend'] || ''
      templatedir = node.document.attributes['templatedir'] || ''
      node_name = node.node_name || ''

      %x(
          var template = afx.getTemplate(#{templatedir},#{backend},#{node_name})
          var compiled = jade.compile(template, {pretty: true});
          return compiled({ node: #{node} });
      )
    end
  end
end