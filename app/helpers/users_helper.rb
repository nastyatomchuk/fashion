module UsersHelper
  def field_validity_class(model, attribute)
    return unless model.errors.include?(attribute)

      "is-invalid"

  end

  def user_valiadation(model, attribute)
    return unless  model.errors.include?(attribute)
    <div class="invalid-feedback">
      model.errors.full_messages_for(attribute).each do |error_message|
          error_message
      end
    </div>
    end
end
