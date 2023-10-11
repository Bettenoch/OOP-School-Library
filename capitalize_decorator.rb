require './base_decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    super.capitalize
  end
end
