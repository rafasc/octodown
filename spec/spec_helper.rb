require 'octodown'
require 'rack/test'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.default_formatter = 'doc' if config.files_to_run.one?
  config.order = :random

  Kernel.srand config.seed

  config.include Rack::Test::Methods

  def dummy_path
    File.expand_path File.join(Dir.pwd, 'spec', 'support', 'test.md')
  end

  def dummy_file
    File.new dummy_path
  end

  def assets_dir(*args)
    File.join Octodown.root, 'assets', args
  end
end
