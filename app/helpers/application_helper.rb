module ApplicationHelper

  def display_flash_messages(params = nil)
    params ||= flash
    html = ''
    params.each do |type, message|
      html += %{<div class="alert-message #{type.to_s}"><a class="close" href="#">x</a><p>#{message}</p></div>}
    end
    html.html_safe
  end

  def simple_input(f, name, type = :text_field)
    html = tag(:div, {class: 'clearfix'}, true)
    html << f.label(name)
    html << tag(:div, {class: 'input'}, true)
    html << f.send(type, name)
    html << '</div>'.html_safe
    html << '</div>'.html_safe
    html
  end

  def form_actions(f, value)
    html = ''
    html << tag(:div, {class: 'actions'}, true)
    html << f.submit(value, :class => 'btn primary')
    html << "&nbsp;"
    html << button_tag("Cancel", :class => 'btn', :type => 'reset')
    html << '</div>'.html_safe
    html.html_safe
  end

  def page_header(heading, subheading = '')
    html = ''
    html << tag(:div, {class: 'page-header'}, true)
    html << tag(:h1, nil, true)
    html << heading
    html << "&nbsp;&rarr;&nbsp;#{subheading}" unless subheading.empty?
    html << '</h1>'
    html << '</div>'
    html.html_safe
  end

  def start_block(title="")
    html = ''
    html << tag("div", {:class => "block"}, true)
    html << tag("div", {:class => "content", }, true)
    html << tag("h2", {:class => "title"}, true)
    html << title
    html << '</h2>'
    html << tag("div", {:class => "inner", }, true)
    html.html_safe
  end

  def block_content(title, &block)
    raise "no block" unless block_given?(&block)
    content = capture(&block)
    html = ''
    html << tag("div", {:class => "block"}, true)
    html << tag("div", {:class => "content", }, true)
    html << tag("h2", {:class => "title"}, true)
    html << title
    html << '</h2>'
    html << tag("div", {:class => "inner", }, true)
    html << content
    html << '</div>'
    html << '</div>'
    html << '</div>'
    html.html_safe
  end

  def block_content_with_subnav(title, subnav, locals, &block)
    raise "no block" unless block_given?(&block)
    content = capture(&block)
    html = <<-HTML
    <div class="block">
    #{render(:partial => subnav, :locals => locals)}
      <div class="content">
        <h2 class="title">#{title}</h2>
        <div class="inner">#{content}</div>
      </div>
    </div>
    HTML
    html.html_safe
  end

  def subnavigation
    html = ''
    unless @pages.blank?
      html << '<ul>'
      @pages.each {|page| html << "<li class='#{current?(page.slug)}'>#{link_to page.link_title, page.url}</li>"}
      html << '</ul>'
    end
    html.html_safe
  end

  def link_to_section(name, label, path, options = {}, &block)
    options[:class] ||= ''
    options[:class] += selected_section == name ? " active" : ''

    text = label
    text = tag(:span, :class => options[:span_class]) + text if options[:span_class]

    html = ''
    html << tag("li", options, true)
    html << link_to(text, path)
    if block_given?(&block)
      html << capture(&block)
    end
    html << '</li>'
    html.html_safe
  end

end