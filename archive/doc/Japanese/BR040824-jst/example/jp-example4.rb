#!/usr/bin/env ruby

require 'bio'

serv = Bio::KEGG::API.new

# �ѥ���������ΰ����ҤΥꥹ��
genes = serv.get_genes_by_pathway("path:hsa00020")
puts "# genes on human's pathway 00020"
genes.each do |gene|
  puts gene
end

# EC�ֹ�������̾���б��Ť�
list = ["ec:1.1.1.1", "ec:1.2.1.1"]
list.each do |ec|
  puts "# E. coli genes for #{ec}:"
  puts serv.get_genes_by_enzyme(ec, "eco")
end

