require './nameable'

class Decorator < Nameable
  # instance methods
  def initialize(nameable)
    super()

    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
