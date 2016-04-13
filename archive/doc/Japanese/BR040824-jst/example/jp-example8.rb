#!/usr/bin/env ruby

require 'bio'

serv = Bio::DAS.new("http://das.hgc.jp/cgi-bin/")

# 酵母のI番染色体1001塩基から2000塩基の範囲を指定、DNA配列を取得
segment = Bio::DAS::SEGMENT.region("I", 1001, 2000)
list = serv.get_dna("sce", segment)
list.each do |dna|
  puts dna.sequence
end

# 上記と同じ範囲で遺伝子アノテーションを取得
list = serv.get_features("sce", segment)
list.segments.each do |segment|
  segment.features.each do |feature|
    puts feature.entry_id
    puts feature.start
  end
end

