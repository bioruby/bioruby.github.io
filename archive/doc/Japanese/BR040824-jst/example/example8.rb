#!/usr/bin/env ruby

require 'bio'

serv = Bio::DAS.new("http://das.hgc.jp/cgi-bin/")

segment = Bio::DAS::SEGMENT.region("I", 1001, 2000)

# get DNA sequence from S. cerevisiae
list = serv.get_dna("sce", segment)
list.each do |dna|
  puts "# chromosome",	dna.entry_id
  puts "# start",	dna.start
  puts "# stop",	dna.stop
  puts "# sequence",	dna.sequence
end

# get features
list = serv.get_features("sce", segment)
list.segments.each do |segment|
  segment.features.each do |feature|
    puts "# feature",	feature.entry_id
    puts "# start",	feature.start
    #puts "# stop",	feature.stop	# BUG: not work with bioruby < 0.6.2
    puts "# orientation", feature.orientation
  end
end


