module Source::Persistence
  def persist_data(data)
    redis.set("data", data.to_json)
  end

  def retrieve_data
    HashWithIndifferentAccess.new(
      JSON.parse(redis.get("data"))
    )
  end

protected

  def redis
    Redis::Namespace.new("Source:#{self.name}", redis: $redis)
  end
end
