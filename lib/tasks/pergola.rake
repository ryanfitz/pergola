desc "update jquery ujs file from github"
task :update_jquery_ujs do
  puts "copying over jquery ujs"
  system "curl http://github.com/rails/jquery-ujs/raw/master/src/rails.js > #{File.expand_path("../../../public/javascripts/rails.js", __FILE__)}"
end