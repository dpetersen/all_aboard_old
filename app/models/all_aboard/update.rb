class AllAboard::Update
  EXPIRATION_PERIOD = 5.minutes

  def self.persist(source_class, source_data)
    remove_expired

    # TODO: Namespace all of this under AllAboard
    score = Time.now.to_i
    data = {
      id: source_class.name,
      data_object: source_data
    }
    AllAboard.redis.zadd("updates", score, data.to_json)
  end

  def self.remove_expired
    AllAboard.redis.zremrangebyscore("updates", "-inf", EXPIRATION_PERIOD.ago.to_i)
  end

  def self.since(timestamp)
    # TODO: Patch fakeredis to handle exclusive ranges with "(", then use that.
    minimum_score = timestamp.to_i + 1
    maximum_score = "+inf"
    all_updates = AllAboard.redis.zrangebyscore("updates", minimum_score, maximum_score)

    with_only_latest_updates_per_source(all_updates)
  end

  def self.with_only_latest_updates_per_source(updates)
    updates.reverse.uniq { |u| u["id"] }.reverse
  end
end
