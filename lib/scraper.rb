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
    courses_noko = self.get_page.css(".post h2")
  end

  def make_courses
    courses_array = []
    self.get_courses.each {|course| courses_array << course.text}
    courses_array
  end

end
