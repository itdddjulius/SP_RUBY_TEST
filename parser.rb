#!/usr/bin/env ruby 

class Parser
  def parse
    log = load_log
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