#!/usr/bin/env ruby

require 'bio'

serv = Bio::DAS.new("http://das.hgc.jp/cgi-bin/")

# �����I��������1001���𤫤�2000������ϰϤ���ꡢDNA��������
segment = Bio::DAS::SEGMENT.region("I", 1001, 2000)
list = serv.get_dna("sce", segment)
list.each do |dna|
  puts dna.sequence
end

# �嵭��Ʊ���ϰϤǰ����ҥ��Υơ����������
list = serv.get_features("sce", segment)
list.segments.each do |segment|
  segment.features.each do |feature|
    puts feature.entry_id
    puts feature.start
  end
end

