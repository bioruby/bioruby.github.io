#!/usr/bin/ruby

require 'bio'

serv = Bio::KEGG::API.new

# KEGG�˸��ߴޤޤ�Ƥ�����ʪ��Υꥹ��
orgs = serv.list_organisms
puts "# list of organisms in KEGG"
orgs.each do |entry|
  puts "#{entry.entry_id} #{entry.definition}"
end

# KEGG�����Ѳ�ǽ�ʥҥ�(hsa)�Υѥ��������Υꥹ��
list = serv.list_pathways("hsa")
puts "# list of pathways for human in KEGG"
list.each do |entry|
  puts "#{entry.entry_id} #{entry.definition}"
end

# ʣ����KEGG GENES����ȥ�����
puts "Human gene entries for gene 7368 and 7369"
puts serv.bget("hsa:7368 hsa:7369")

