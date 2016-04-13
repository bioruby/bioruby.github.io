#!/usr/bin/ruby

require 'bio'

serv = Bio::KEGG::API.new

# KEGGに現在含まれている生物種のリスト
orgs = serv.list_organisms
puts "# list of organisms in KEGG"
orgs.each do |entry|
  puts "#{entry.entry_id} #{entry.definition}"
end

# KEGGで利用可能なヒト(hsa)のパスウェイのリスト
list = serv.list_pathways("hsa")
puts "# list of pathways for human in KEGG"
list.each do |entry|
  puts "#{entry.entry_id} #{entry.definition}"
end

# 複数のKEGG GENESエントリを取得
puts "Human gene entries for gene 7368 and 7369"
puts serv.bget("hsa:7368 hsa:7369")

