module Source::Jobs
  def has_job(job_class, frequency)
    @jobs_for_frequencies ||= {}
    @jobs_for_frequencies[frequency] ||= []
    @jobs_for_frequencies[frequency] << job_class
  end

  def jobs_for_frequencies
    @jobs_for_frequencies || {}
  end
end
