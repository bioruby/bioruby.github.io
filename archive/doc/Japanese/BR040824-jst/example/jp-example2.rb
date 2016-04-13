#!/usr/bin/env ruby

require 'bio'

serv = Bio::KEGG::API.new

# �����Ҥ�KO�ֹ�Υꥹ�Ȥ����
list = serv.get_ko_by_gene("eco:b0002")
# ��Ȥ��ƣ����ܤ�KO�ֹ��Ȥ�
ko_id = list.first

# Ʊ��KO (KEGG Orthology) ���������󤵤줿�����ҤΥꥹ��
ko_genes = serv.get_ko_members(ko_id)

# Ʊ��OC (Ortholog Cluster) ���������󤵤줿�����ҤΥꥹ��
oc_genes = serv.get_all_oc_members_by_gene("hsa:7368")

# Ʊ��PC (Paralog Cluster) ���������󤵤줿�����ҤΥꥹ��
pc_genes = serv.get_all_pc_members_by_gene("hsa:7368")

puts "# KO", ko_genes
puts "# OC", oc_genes
puts "# PC", pc_genes
