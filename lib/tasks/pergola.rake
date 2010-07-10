desc "update jquery ujs file from github"
task :update_jquery_ujs do
  puts "copying over jquery ujs"
  system "curl http://github.com/rails/jquery-ujs/raw/master/src/rails.js > #{File.expand_path("../../../public/javascripts/rails.js", __FILE__)}"
end

desc 'Setup the environment to run pergola'
task :setup => :environment do
  puts "Setting up pergola environment..."
  puts "Installing dependencies..."
  sh "bundle install"
  
  puts "finished installing dependencies"
  Rake::Task["ar:setup"].invoke
  
  puts "Finished setting up pergola"
end