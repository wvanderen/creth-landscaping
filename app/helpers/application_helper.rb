require 'redcarpet'

module ApplicationHelper
    def form_group_tag(errors, &block)
        css_class = 'form_group'
        css_class << 'has-error' if errors.any?
        content_tag :div, capture(&block), class: css_class
    end
    
    def is_premium?
        true if current_user && current_user.premium?
    end
    
    def is_standard?
        true if current_user && current_user.standard?
    end
    
    def markdown(text)
        options = {
            filter_html:     true,
            hard_wrap:       true,
            link_attributes: { rel: 'nofollow', target: "_blank" },
            space_after_headers: true,
            fenced_code_blocks: true
        }

        extensions = {
            autolink:           true,
            superscript:        true,
            disable_indented_code_blocks: true
        }

        renderer = Redcarpet::Render::HTML.new(options)
        markdown = Redcarpet::Markdown.new(renderer, extensions)

        markdown.render(text).html_safe
    end
end
