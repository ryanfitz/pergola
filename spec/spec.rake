require 'spec/rake/spectask'

Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = Dir['spec/**/*_spec.rb']
  t.spec_opts  = %w(-fs --color)
end
