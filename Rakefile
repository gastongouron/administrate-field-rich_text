require "bundler/gem_tasks"

task :npm do
  sh 'npm install quill' unless File.exist?('node_modules/quill/package.json')
end

desc 'Clean the vendor directory'
task :clean do
  Rake.rake_output_message 'Cleaning up the assets directory.'
  FileUtils.rm_rf 'app/assets/javascripts/quill.min.js'
  FileUtils.rm_rf 'app/assets/stylesheets/quill.snow.css'
end

desc 'Generate the JavaScript assets'
task javascripts: :npm do
  target_dir = 'app/assets/javascripts'
  FileUtils.mkdir_p target_dir
  Rake.rake_output_message 'Generating JavaScripts.'
  FileUtils.cp_r Dir['node_modules/quill/dist/quill.min.js'], target_dir
end

desc 'Generate the CSS assets'
task stylesheets: :npm do
  target_dir = 'app/assets/stylesheets'
  mkdir_p target_dir
  Rake.rake_output_message 'Generating stylesheets'
  FileUtils.cp Dir['node_modules/quill/dist/quill.snow.css'], target_dir
end

desc 'Clean and then generate everything'
task assets: [:clean, :javascripts, :stylesheets]
task default: :assets
