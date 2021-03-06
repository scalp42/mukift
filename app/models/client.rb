
class Client < ActiveRecord::Base

  attr_accessor :banned_version
  attr_reader :version

  def banned_version?
    self.banned_version == true
  end

  def version=(version)
    @version = version
    if self.min_version && self.min_version > version.to_i 
      self.banned_version = true
    end
  end
end
