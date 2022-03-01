class PrefixUrl < Nanoc::Filter
  identifier :prefix_url

  def run(content, keys:)
    hash = deep_symbolize_keys(content)
    hash.tap do |dup|
      keys.each do |key|
        next if dotted_lookup(dup, key.to_s).nil?
        dotted_write(dup, key, prefix_url(dotted_lookup(dup, key.to_s)))
      end
    end
  end

  private

  def deep_symbolize_keys(hash)
    {}.tap do |stringified_hash|
      hash.each do |key, value|
        stringified_hash[key.to_sym] = value.is_a?(Hash) ?
          deep_symbolize_keys(value) :
          value
      end
    end
  end
end
