class MetadataToJson < Nanoc::Filter
  identifier :metadata_to_json

  NANOC_KEYS = [:filename, :content_filename, :meta_filename, :extension, :mtime].freeze

  def run(content, params = {})
    item = params[:item]
    hash_except(NANOC_KEYS, item.attributes).to_json
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
