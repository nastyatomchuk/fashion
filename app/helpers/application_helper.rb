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
    link_to icon('fa-solid fa-circle-plus') + " Создать",
            url, class: 'btn btn-primary btn-lg btn-min-120 float-end'
  end

  def edit_link(url)
    link_to icon('fa fa-pencil'), url
  end

  def destroy_link(url)
    link_to icon('fa fa-times'), url, method: :delete, data: { confirm: 'Вы уверены?' }
  end

  def in_dollars(price)
    number_to_currency(price)
  end

  def current_cart
    if Cart.find_by_id(session[:cart_id]).nil?
      Cart.new
    else
      Cart.find_by_id(session[:cart_id])
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def catedories
    @categories = Category.order(:name)
  end

  def size(size)
    @products = Product.all.where(category_id: params[:id]).page(1).per(15)
                       .joins(:stores).where("quantity > 0")
                  .joins(:stores).where(:stores => {size: size})
  end

end