class Course
  attr_accessor :title, :schedule, :description
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    self.all
  end

  def self.reset_all 
    @@all.delete_if {|x| true}
  end 

end
