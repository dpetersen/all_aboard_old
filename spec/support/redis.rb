RSpec.configure do |config|
  config.around(:each) do |example|
    AllAboard.redis = Redis.new
    example.run
    AllAboard.redis.flushdb
  end
end
