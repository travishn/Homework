module ApplicationHelper

  def auth_token #need html_safe because when you put a string into a template, it does something known as escaping where it literally reads the quotes as 'quot' and (< or >) sign as (&lt; and &gt;)
    "<input
      type='hidden'
      name='authenticity_token'
      value=#{form_authenticity_token}>".html_safe
  end
end
