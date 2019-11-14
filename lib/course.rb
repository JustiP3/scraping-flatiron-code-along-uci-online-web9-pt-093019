class Course
  attr_accessor :title, :schedule, :description
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    self.all
  end

end
