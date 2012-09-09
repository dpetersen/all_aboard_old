module AllAboard
  module Source::ViewData
    def persist_data(data)
      redis.set("data", data.to_json)
      Update.persist(self, data)
    end

    def retrieve_data
      data = redis.get("data")
      return {} if data.nil?

      HashWithIndifferentAccess.new(JSON.parse(data))
    end

  protected

    def redis
      Redis::Namespace.new("Source:#{self.name}", redis: AllAboard.redis)
    end
  end
end
