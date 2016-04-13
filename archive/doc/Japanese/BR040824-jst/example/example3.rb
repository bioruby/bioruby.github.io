#!/usr/bin/env ruby

require 'bio'

serv = Bio::KEGG::API.new

puts "# lists available organisms in KEGG"
orgs = serv.list_organisms
orgs.each do |entry|
  puts "#{entry.entry_id} #{entry.definition}"
end

puts "# lists available pathways for human in KEGG"
list = serv.list_pathways("hsa")
list.each do |entry|
  puts "#{entry.entry_id} #{entry.definition}"
end

puts "# getting entries from KEGG GENES"
puts serv.bget("hsa:7368 hsa:7369")

