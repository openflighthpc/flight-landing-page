class MetadataToJson < Nanoc::Filter
  identifier :metadata_to_json

  NANOC_KEYS = [:filename, :content_filename, :meta_filename, :extension, :mtime].freeze
  OVERRIDE_KEYS = [:__override__, :__override_source__, :__overridden_identifier__].freeze

  def run(metadata_content, **kwargs)
    hash_except(NANOC_KEYS + OVERRIDE_KEYS, metadata_content).to_json
  end

  private

  def hash_except(keys, hash)
    hash.dup.tap do |dup|
      keys.each do |key|
        dup.delete(key)
      end
    end
  end
end
