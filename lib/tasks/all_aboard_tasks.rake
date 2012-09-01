 desc "Queue up all jobs for a certain frequency, passed in as FREQUENCY"
 task queue_jobs: :environment do
   frequency = ENV["FREQUENCY"]
   raise "You have to pass a frequency!" if frequency.nil?

   AllAboard::SourceManager.instance.queue_jobs_for_frequency(frequency.to_sym)
 end
