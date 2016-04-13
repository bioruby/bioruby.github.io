#!/usr/bin/env ruby

require 'bio'

serv = Bio::KEGG::API.new

# 指定したいパスウェイ上の遺伝子のリスト
path = ARGV.shift || "path:eco00010"
genes = serv.get_genes_by_pathway(path)

# PDBにリンクのある遺伝子を検索
results = Hash.new
genes.each do |gene|
  if pdb_links = serv.get_all_linkdb_by_entry(gene, "pdb")
    pdb_links.each do |link|
      results[gene] = true
    end
  end
end

# 色付き画像を生成
url = serv.mark_pathway_by_objects(path, results.keys)

# 画像を保存
serv.save_image(url, "example7.gif")

