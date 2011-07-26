require 'rake'
require 'rake/testtask'
require 'bundler'
Bundler::GemHelper.install_tasks

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')

desc "release and build and push new website"
task :push => [:release, :web]

desc "Bumps version number up one and git commits"
task :bump do
  basefile = "lib/firelinks/version.rb"
  file = File.read(basefile)
  oldver = file[/VERSION = '(\d.\d.\d)'/, 1]
  newver_i = oldver.gsub(".", '').to_i + 1
  newver = ("%.3d" % newver_i).split(//).join('.')
  puts oldver
  puts newver
  puts "Bumping version: #{oldver} => #{newver}"
  newfile = file.gsub("VERSION = '#{oldver}'", "VERSION = '#{newver}'") 
  File.open(basefile, 'w') {|f| f.write newfile}
  `git commit -am 'Bump'`
end

desc "build and push website"
task :web => :build_webpage do
  puts "Building and pushing website"
  Dir.chdir "../project-webpages" do
    `scp out/firelinks.html zoe2@instantwatcher.com:~/danielchoi.com/public/software/`
    #`rsync -avz out/images-firelinks zoe2@instantwatcher.com:~/danielchoi.com/public/software/`
    #`rsync -avz out/stylesheets zoe2@instantwatcher.com:~/danielchoi.com/public/software/`
    #`rsync -avz out/lightbox2 zoe2@instantwatcher.com:~/danielchoi.com/public/software/`
  end
  #`open http://danielchoi.com/software/firelinks.html`
end

desc "build webpage"
task :build_webpage do
  `cp README.markdown ../project-webpages/src/firelinks.README.markdown`
  #`cp coverage.markdown ../project-webpages/src/firelinks.coverage.markdown`
  Dir.chdir "../project-webpages" do
    puts `ruby gen.rb firelinks #{Firelinks::VERSION}`
    `open out/firelinks.html`
  end
end


desc "git push and rake release bumped version"
task :bumped do
  puts `git push && rake release`
  Rake::Task["web"].execute
end

task :default => :web

