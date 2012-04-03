require File.join(File.dirname(__FILE__), "jobs", "test_every_five_job")
require File.join(File.dirname(__FILE__), "jobs", "test_four_times_daily_job")

class BasicTestSource < AllAboard::Source
  self.configurable_attributes = [ :a_source_value, :a_second_source_value ]

  has_job TestEveryFiveJob, :five_minutes
  has_job TestFourTimesDailyJob, :four_daily

  perspective("A Test Perspective")
  perspective("A Perspective With Configuration Data")
end

AllAboard::SourceManager.instance.register_source(BasicTestSource)
