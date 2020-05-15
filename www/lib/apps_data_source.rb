class AppsDataSource < ::Nanoc::DataSource
  # The apps data source stores its items in nested directories. Items are
  # represented by a single text file; the metadata can be contained in this
  # file.
  #
  # The default root directory for items is the `apps` directory.  This can be
  # overridden in the data source configuration:
  #
  #     data_sources:
  #       - type:         apps
  #         content_dir:  installed_apps
  #
  # The file for the item can start with a metadata section: it can be stored
  # at the top of the file, between `---` (three dashes) separators. For
  # example:
  #
  #     ---
  #     title: "Moo!"
  #     ---
  #     h1. Hello!
  #
  # The metadata section can be omitted. If the file does not start with
  # three or five dashes, the entire file will be considered as content.
  #
  # The identifier of items and layouts is the filename itself, without the
  # root directory (as determined by the `content_dir` configuration
  # attribute), and with the prefix `/apps/` For example:
  #
  #     foo/bar/index.html → /apps/foo/bar/index.html
  #     foo/bar.md       → /apps/foo/bar.md
  #
  # Note that each item must have an unique identifier. Nanoc will display an
  # error if two items with the same identifier are found.
  #
  # The file extension does not determine the filters to run on items; the
  # Rules file is used to specify processing instructors for each item.
  #
  # It is possible to set an explicit encoding that should be used when reading
  # files. In the data source configuration, set `encoding` to an encoding
  # understood by Ruby’s `Encoding`. If no encoding is set in the configuration,
  # one will be inferred from the environment.

  identifier :apps

  def items
    proto_apps.map do |proto_app|
      new_item(
        proto_app.content,
        proto_app.attributes.merge(kind: 'app'),
        Nanoc::Identifier.new("/#{proto_app.filename}"),
      )
    end
  end

  private

  def proto_apps
    app_files.map do |app_file|
      result = parse(app_file)
      ProtoApp.new(
        filename: app_file,
        content: result.content,
        attributes: result.attributes,
      )
    end
      .sort
  end

  def app_files
    all_files_in(content_dir_name)
      .reject   { |fn| fn =~ /(~|\.orig|\.rej|\.bak)$/ }
  end

  def content_dir_name
    config.fetch(:content_dir, 'apps')
  end

  # Returns all files in the given directory and directories below it.
  def all_files_in(dir_name)
    Nanoc::DataSources::Filesystem::Tools.all_files_in(dir_name, config[:extra_files])
  end

  def parser
    @parser ||= Nanoc::DataSources::Filesystem::Parser.new(config: config)
  end

  def parse(content_filename)
    meta_filename = nil
    parser.call(content_filename, meta_filename)
  end

  class ProtoApp
    attr_reader :attributes
    attr_reader :content
    attr_reader :filename

    def initialize(filename:, content:, attributes:)
      @attributes = attributes
      @content = content
      @filename = filename
    end

    def <=>(other)
      if order && other.order
        [ order, filename ] <=> [ other.order, other.filename ]
      elsif order.nil? && other.order.nil?
        filename <=> other.filename
      else
        order ? -1 : 1
      end
    end
    
    protected

    def order
      attributes['order']
    end
  end
end
