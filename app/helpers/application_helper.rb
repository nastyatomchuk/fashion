module ApplicationHelper
  def flash_type(name)
    if name == 'alert'
      'error'
    else
      'success'
    end
  end
end
