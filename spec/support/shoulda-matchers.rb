Shoulda::Matchers.configure do |config|
  config.integrante do |with|
    with.test_framework :rspec
    with.library :rails
  end
end