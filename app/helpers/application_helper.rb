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
end
