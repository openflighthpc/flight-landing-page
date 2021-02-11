class OverrideFilesystemDataSource < ::Nanoc::DataSources::Filesystem
  identifier :override_filesystem

  def items
    super.each do |i|
      i.attributes.merge!(
        __override__: true,
        __overridden_identifier__: i.identifier,
      )
      i.identifier = "/__override__#{override_name}_#{i.identifier}"
    end
  end

  def layouts
    super.each do |i|
      i.attributes.merge!(
        __override__: true,
        __overridden_identifier__: i.identifier,
      )
      i.identifier = "/__override__#{override_name}_#{i.identifier}"
    end
  end

  private

  def override_name
    @config[:override_name]
  end
end
