class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} should implement method #{__method__}"
  end
end
