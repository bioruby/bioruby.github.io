
require 'find'

desc "regenerate index.html"
task :reindex do
  str = `find archive contrib -type d -print`
  str.each_line do |line|
    dir = line.chomp
    sc = File.expand_path('directory_index.erb')
    outfn = File.join(dir, 'index.html')
    $stderr.print "Creating #{outfn} ... "
    system('erb', sc, chdir: dir, out: outfn)
    $stderr.puts "Done."
  end
end
