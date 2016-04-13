#!/usr/bin/env ruby

require 'bio'

# KEGG APIのサーバに接続
serv = Bio::KEGG::API.new

# 各生物種のbest-hit遺伝子を取得
homologs = serv.get_all_best_neighbors_by_gene("hsa:7368")

homologs.each do |hit|
  # hitした遺伝子名を取り出す
  gene = hit.genes_id2
  # KEGG APIで検索して遺伝子がモチーフを持っていれば
  if motifs = serv.get_motifs_by_gene(gene, "pfam")
    motifs.each do |motif|
      # 各モチーフのIDと説明を取り出してタブ区切りで表示
      name = motif.motif_id
      desc = motif.definition
      puts "#{gene}:\t#{name}\t#{desc}"
    end
  end
end

