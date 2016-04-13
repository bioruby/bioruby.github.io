#!/usr/bin/env ruby

require 'bio'

serv = Bio::KEGG::API.new

homologs = serv.get_all_best_neighbors_by_gene("hsa:7368")

homologs.each do |hit|
  # name of the target gene in the SSDBResult object
  gene = hit.genes_id2
  # search Pfam motifs for each gene using SSDB
  motifs = serv.get_motifs_by_gene(gene, "pfam")
  if motifs
    motifs.each do |motif|
      name = motif.motif_id
      desc = motif.definition
      puts "#{gene}:\t#{name}\t#{desc}"
    end
  else
    puts "#{gene}:\tNo motifs found."
  end
end

