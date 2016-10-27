module IsAdminHelper

  def render_is_admin(user)
    if user.is_admin
      content_tag(:span, "(admin)", class: "fa fa-diamond")

    else
      # content_tag(:span, "", class: "fa fa-user")
    end
  end
end
