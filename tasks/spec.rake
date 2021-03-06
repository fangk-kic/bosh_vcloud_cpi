namespace :spec do
  desc 'unit test'
  RSpec::Core::RakeTask.new :unit do |t|
    t.pattern = 'spec/unit/**/*_spec.rb'
  end

  desc 'integration test'
  RSpec::Core::RakeTask.new :integration, :cfg_file do |t, args|
    ENV['TEST_SETTINGS'] ||= args[:cfg_file]
    t.pattern = 'spec/integration/**/*_spec.rb'
  end

  desc 'stress test'
  RSpec::Core::RakeTask.new :stress, :director_url, :manifest, :base_ip do |t, args|
    ENV['STRESS_DIRECTOR'] ||= args[:director_url]
    ENV['STRESS_MANIFEST'] ||= args[:manifest]
    ENV['STRESS_BASE_IP']  ||= args[:base_ip]
    t.pattern = 'spec/stress/**/*_spec.rb'
  end
end