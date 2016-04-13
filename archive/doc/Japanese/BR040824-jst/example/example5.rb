#!/usr/bin/env ruby

require 'bio'

serv = Bio::KEGG::API.new

# mark pathway
objs = ['eco:b0002', 'cpd:C00263']
url1 = serv.mark_pathway_by_objects('path:eco00260', objs)
puts "# URL for marked pathway:", url1

# color pathway
fg_list = ['blue', 'green']
bg_list = ['#ff0000', 'yellow']
url2 = serv.color_pathway_by_objects('path:eco00260',
         objs, fg_list, bg_list)
puts "# URL for colored pathway:", url2

# save the result images
serv.save_image(url1, "example5-1.gif")
serv.save_image(url2, "example5-2.gif")

