#!/usr/bin/env ruby

require 'bio'

serv = Bio::KEGG::API.new

# list of genes on specified pathway
path = ARGV.shift || "path:eco00010"
genes = serv.get_genes_by_pathway(path)

# search DB links to PDB using LinkDB 
results = Hash.new
genes.each do |gene|
  puts "#{gene} is linked to:"
  if pdb_links = serv.get_all_linkdb_by_entry(gene, "pdb")
    pdb_links.each do |link|
      results[gene] = true
      # linked entry name
      print "\t" + link.entry_id2
    end
  end
  puts
end

# generates colored image
linked_genes = results.keys
url = serv.mark_pathway_by_objects(path, linked_genes)
puts "# URL of the result image", url

# save the image
serv.save_image(url, "linked_to_pdb.gif")

