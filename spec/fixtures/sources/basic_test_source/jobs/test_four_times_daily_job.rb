class TestFourTimesDailyJob
  include Sidekiq::Worker

  def perform
    raise "I shouldn't get called!"
  end
end
