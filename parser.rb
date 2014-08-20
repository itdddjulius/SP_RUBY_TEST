#!/usr/bin/env ruby 

class Parser
  def parse
    log = load_log
    totals = {}
    log.each do |line|
      line_array = line.split(' ')
      totals["#{line_array[0]}"] ? totals["#{line_array[0]}"] += 1 : totals["#{line_array[0]}"] = 1
    end
    totals = totals.sort_by { |page, total| total }.reverse
    puts "List of webpages with most page views ordered from most pages views to less page views"
    totals.each do |total|
      puts "\t#{total[0]} #{total[1]} #{total[1] ==1 ? "visit" : "visits"}"
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