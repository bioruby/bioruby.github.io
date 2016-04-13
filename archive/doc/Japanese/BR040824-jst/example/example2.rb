#!/usr/bin/env ruby

require 'bio'

serv = Bio::KEGG::API.new

# list of KO IDs assigned to E. coli gene b0002
list = serv.get_ko_by_gene("eco:b0002")
puts "# list of KO IDs assigned to eco:b0002"
puts list

# use 1st KO ID as an example
ko_id = list[0]

# obtain list of genes assigned to the same KO

ko_genes = serv.get_ko_members(ko_id)
puts "# list of KO members for eco:b0002 (#{ko_id})"
puts ko_genes
puts "# number of genes in this KO (#{ko_id}):"
puts ko_genes.size

# obtain list of genes assigned to the same OC

oc_genes = serv.get_all_oc_members_by_gene("hsa:7368")
puts "# list of OC members for hsa:7368"
puts oc_genes
puts "# number of genes in this OC:"
puts oc_genes.size

# obtain list of genes assigned to the same PC

pc_genes = serv.get_all_pc_members_by_gene("hsa:7368")
puts "# list of OC members for hsa:7368"
puts pc_genes
puts "# number of genes in this PC:"
puts pc_genes.size

