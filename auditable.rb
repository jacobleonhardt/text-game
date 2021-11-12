module Auditable

  def audit
    puts "Rolled a #{self.result} (#{self.class})"
  end

end
