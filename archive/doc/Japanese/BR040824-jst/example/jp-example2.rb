#!/usr/bin/env ruby

require 'bio'

serv = Bio::KEGG::API.new

# 遺伝子のKO番号のリストを取得
list = serv.get_ko_by_gene("eco:b0002")
# 例として１つ目のKO番号を使う
ko_id = list.first

# 同じKO (KEGG Orthology) がアサインされた遺伝子のリスト
ko_genes = serv.get_ko_members(ko_id)

# 同じOC (Ortholog Cluster) がアサインされた遺伝子のリスト
oc_genes = serv.get_all_oc_members_by_gene("hsa:7368")

# 同じPC (Paralog Cluster) がアサインされた遺伝子のリスト
pc_genes = serv.get_all_pc_members_by_gene("hsa:7368")

puts "# KO", ko_genes
puts "# OC", oc_genes
puts "# PC", pc_genes
