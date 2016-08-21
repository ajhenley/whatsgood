module IconsHelper
  # FontAwesome icon helper. Use name without "fa fa-" prefix.
  # Visit https://fortawesome.github.io/Font-Awesome/icons/ for more icons
  #
  # Useage:
  #   <%= fa_icon_tag "heart" %>
  #   <%= fa_icon_tag "heart", class: "red" %>
  #
  def fa_icon_tag(name, options = {})
    content_tag(:i, nil, class: "fa fa-#{name} #{options[:class]}")
  end

  # Glyphicons icon helper. Use name without "glyphicon glyphicon-" prefix.
  # Visit http://getbootstrap.com/components/ for more icons
  #
  # Useage:
  #   <%= glyphicon_tag "heart" %>
  #   <%= glyphicon_tag "heart". class: "red" %>
  #
  def glyphicon_tag(name, options = {})
    content_tag(:i, nil, class: "glyphicon glyphicon-#{name} #{options[:class]}")
  end

  # Pe-icon-7-stroke icon helper. Use name without "pe-7s-" prefix.
  # Visit http://themes-pixeden.com/font-demos/7-stroke/ for more icons
  #
  # Useage:
  #   <%= pe_7s_tag "album" %>
  #   <%= pe_7s_tag "album", class: "red" %>
  #
  def pe_7s_tag(name, options = {})
    content_tag(:i, nil, class: "pe-7s-#{name} #{options[:class]}")
  end
end
