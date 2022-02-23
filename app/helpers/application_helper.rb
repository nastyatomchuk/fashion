module ApplicationHelper
  def flash_type(name)
    return 'success' if name == 'notice'

    'error'
  end

  def field_validity_class(model, attribute)
    return unless model.errors.include?(attribute)

    'is-invalid'
  end

  def filed_errors(model, attribute)
    return unless model.errors.include?(attribute)

    content_tag(:div, class: 'invalid-feedback') do
      model.errors.full_messages_for(attribute).join(', ')
    end
  end

  def icon(classes, title = nil, style = nil, id = nil)
    content_tag :i, '', class: "#{classes}", title: title, style: style, id: id
  end

  def new_right_button(url)
    link_to icon('fa-solid fa-circle-plus') + " New",
            url, class: 'btn btn-primary btn-lg btn-min-120 float-end'
  end

  def edit_button(url)
    link_to icon('fa fa-pencil'), url
  end

  def destroy_button(url, method)
    link_to icon('fa fa-times'), url, method: :delete, data: { confirm: 'Are you sure?' }
  end

  def in_dollars(price)
    number_to_currency(price)
  end
end
