class OverrideFilesystemDataSource < ::Nanoc::DataSources::Filesystem
  identifier :override_filesystem

  def items
    super.each do |i|
      i.attributes.merge!(
        __override__: true,
        __overridden_identifier__: i.identifier,
      )
      i.identifier = "/__override__#{i.identifier}"
    end
  end
end
