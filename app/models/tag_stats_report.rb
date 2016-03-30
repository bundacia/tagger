class TagStatsReport

  def as_json(options=nil)
    { tag_counts: tag_counts }
  end

  private

  def tag_counts
    tag_count_hash.map {|k,v| {tag: k, count: v}}
  end

  def tag_count_hash
    Tag.group(:tag).count
  end
end
