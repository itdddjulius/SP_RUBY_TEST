#!/usr/bin/env ruby 
# ===================================================================================
# MODULE : parser.rb
#
# AUTHOR : Julius Olatokunbo
#
# WRITTEN: TUE - 16 July 2019
#
# REASON : Ruby Developer Test
# The test is as follows:
#  1. ruby_app
#  Write a ruby script that:
#  a. Receives a log as argument (webserver.log is provided)
#  e.g.: ./parser.rb webserver.log
#  b. Returns the following:
#  > list of webpages with most page views ordered from most pages views to less page views
#  e.g.:
#  /home 90 visits /index 80 visits etc... > list of webpages with most
#  unique page views also ordered
#  e.g.:
#  /about/2 8 unique views
#  /index 5 unique views etc...
#
# ===================================================================================

class Parser
  def parse
    log = load_log
    page_visits(log)
    unique_visits(log)
  end

  # Each IP that visits a page is a unique visit, no matter how many times it's been accessed from that IP,
  # each IP counts just once.
  def unique_visits(log)
    unique_visits = {}
    log.each do |line|
      line_array = line.split(' ')
      if unique_visits["#{line_array[0]}"]
        if !unique_visits["#{line_array[0]}"].include?("#{line_array[1]}") 
          unique_visits["#{line_array[0]}"] << "#{line_array[1]}" 
        end
      else
        unique_visits["#{line_array[0]}"] = ["#{line_array[1]}"]
      end
    end
    unique_visits = unique_visits.sort_by { |page, visits| visits.count }.reverse
    puts "List of webpages with most unique page views also ordered"
    unique_visits.each do |unique_visit|
      puts "\t#{unique_visit[0]} #{unique_visit[1].count} #{unique_visit[1].count ==1 ? "visit" : "visits"}"
    end
  end

  def page_visits(log)
    page_visits = {}
    log.each do |line|
      line_array = line.split(' ')
      page_visits["#{line_array[0]}"] ? page_visits["#{line_array[0]}"] += 1 : page_visits["#{line_array[0]}"] = 1
    end
    page_visits = page_visits.sort_by { |page, visits| visits }.reverse
    puts "List of webpages with most page views ordered from most pages views to less page views"
    page_visits.each do |page_visit|
      puts "\t#{page_visit[0]} #{page_visit[1]} #{page_visit[1] ==1 ? "visit" : "visits"}"
    end
  end

  def load_log()
    log = []
    log_path = File.expand_path("../#{ARGV.first}", __FILE__)
    f = File.open(log_path, "r")
    f.each_line do |line|
      log << line
    end
    f.close
    return log.compact
  end

end


parser = Parser.new
parser.parse
