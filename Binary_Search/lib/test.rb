require "binary_tree.rb"

a = [10,5,11,4,6,9,1]
b = BinaryTree.new
b.build_tree(a)
b.bf_search(2)
b.to_s
c = b.df_search(9)
puts c
d = b.rdf_search(9)
puts d