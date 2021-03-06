# Ensures multilevel hash merging
class Hash
  def deep_sync!(other)
    other.each do |k, v|
      next unless (tv = self[k])
      self[k] = tv.is_a?(Hash) && v.is_a?(Hash) ? tv.dup.deep_sync(v) : v
    end
    self
  end
end
