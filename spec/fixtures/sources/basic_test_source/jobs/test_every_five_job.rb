class TestEveryFiveJob
  include Sidekiq::Worker

  def perform
    raise "I shouldn't get called!"
  end
end
