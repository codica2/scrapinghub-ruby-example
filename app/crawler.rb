#!/usr/bin/env ruby

# require libraries
require 'typhoeus'
require 'nokogiri'
require 'json'

# determine where to write the result
begin
  outfile = File.open(ENV.fetch('SHUB_FIFO_PATH'), mode: 'w')
rescue IndexError
  outfile = STDOUT
end

# parse response
response = Typhoeus.get('https://www.codica.com/blog/').response_body
doc      = Nokogiri::HTML(response)

# select and save all titles
doc.css('.post-title').each do |title|
  result = JSON.generate(title: title.text.split.join(' '))
  outfile.write result
  outfile.write "\n"
end
