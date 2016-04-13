#!/usr/bin/env ruby

require 'bio'

# KEGG API�Υ����Ф���³
serv = Bio::KEGG::API.new

# ����ʪ���best-hit�����Ҥ����
homologs = serv.get_all_best_neighbors_by_gene("hsa:7368")

homologs.each do |hit|
  # hit����������̾����Ф�
  gene = hit.genes_id2
  # KEGG API�Ǹ������ư����Ҥ�������դ���äƤ����
  if motifs = serv.get_motifs_by_gene(gene, "pfam")
    motifs.each do |motif|
      # �ƥ�����դ�ID����������Ф��ƥ��ֶ��ڤ��ɽ��
      name = motif.motif_id
      desc = motif.definition
      puts "#{gene}:\t#{name}\t#{desc}"
    end
  end
end

