#!/usr/bin/env ruby

require 'bio'

serv = Bio::KEGG::API.new

# ���ꤷ�����ѥ���������ΰ����ҤΥꥹ��
path = ARGV.shift || "path:eco00010"
genes = serv.get_genes_by_pathway(path)

# PDB�˥�󥯤Τ�������Ҥ򸡺�
results = Hash.new
genes.each do |gene|
  if pdb_links = serv.get_all_linkdb_by_entry(gene, "pdb")
    pdb_links.each do |link|
      results[gene] = true
    end
  end
end

# ���դ�����������
url = serv.mark_pathway_by_objects(path, results.keys)

# ��������¸
serv.save_image(url, "example7.gif")

