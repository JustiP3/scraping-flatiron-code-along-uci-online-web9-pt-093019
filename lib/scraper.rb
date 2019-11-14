require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

  def get_page
    doc = Nokogiri::HTML(open('http://learn-co-curriculum.github.io/site-for-scraping/courses'))
  end

  def get_courses
    titles = self.get_page.css(".post h2")
    schedule = self.get_page.css(".post .date")
    binding.pry
  end

  def make_courses
    courses_array = []
    self.get_courses.each do |course|
        #binding.pry
      name = course.text
      course = Course.new
      course.title = name
      coures.schedule = " "
      courses_array << course

    end
    courses_array
  end

end
