use_helper Nanoc::Helpers::Rendering
use_helper Nanoc::Helpers::LinkTo

def dotted_write(hash, dotted_key, value)
  return unless hash.is_a?(Hash)

  keys = dotted_key.split('.')

  if keys.length == 1
    hash[keys.first.to_sym] = value
    return
  end

  keys.each do |key|
    if hash.respond_to?(:[])
      dotted_write(hash[key.to_sym], keys[1..-1].join('.'), value)
    end
  end
end

def dotted_lookup(haystack, dotted_key="")
  keys = dotted_key.split('.')
  keys.reduce(haystack) do |accum, key|
    if accum.respond_to?(:[])
      accum[key.to_sym]
    else
      nil
    end
  end
end

def data_lookup(data_item_name, dotted_key="")
  raw_data = items["/data/#{data_item_name}.yaml"]
  return if raw_data.nil?
  dotted_lookup(raw_data, dotted_key)
end

def branding(dotted_key="")
  data_lookup('branding', dotted_key)
end

def environment(dotted_key="")
  data_lookup('environment', dotted_key)
end

def bookmarks(dotted_key="")
  data_lookup('bookmarks', dotted_key)
end

def prefix_url(url)
  if URI.parse(url).absolute?
    url
  else
    File.join(config[:link_prefix], url).squeeze("/")
  end
end

def raw_contacts
  c = items['/data/contacts.yaml']
  if c.nil?
    []
  else
    c[:contacts] || []
  end
end

def contacts
  @_contacts ||= items
    .select { |i| i[:kind] == 'contact' }
end

def contacts_item
  items['/contacts.*']
end

def raw_links
  l = items['/data/links.yaml']
  if l.nil?
    []
  else
    l[:links] || []
  end
end

def links
  @_links ||= items
    .select { |i| i[:kind] == 'link' }
end

def links_item
  items['/links.*']
end

def sidebar
  items['/sidebar.*']
end

# Return the item listing all installed apps.
#
# This is a single item which includes all of the installed apps.
def apps_item
  items['/apps.*']
end

# Return an ordered list of items for the installed apps.
#
# Each item is for a single installed app.
def app_items
  @_apps ||= items
    .find_all('/apps/**/*')
    .reject { |i| /\.disabled\Z/.match?(i.identifier) }
    .sort { |a, b|
      if a[:order] && b[:order]
        [ a[:order], a.identifier ] <=> [ b[:order], b.identifier ]
      elsif a[:order].nil? && b[:order].nil?
        a.identifier <=> b.identifier
      else
        a[:order] ? -1 : 1
      end
    }
end

def blurb
  items['/blurb.*']
end

def config_packs_item
  items['/config-packs.*']
end

def config_pack_items
  @__config_packs ||= items.find_all('/config-packs/**/*')
                           .reject { |i| /\.disabled\Z/.match?(i.identifier) }
                           .sort do |a, b|
    if a[:order] && b[:order]
      [ a[:order], a.identifier ] <=> [ b[:order], b.identifier ]
    elsif a[:order].nil? && b[:order].nil?
      a.identifier <=> b.identifier
    else
      a[:order] ? -1 : 1
    end
  end
end

def tools_item
  items['/tools.*']
end

def enable_https
  items['/enable-https.*']
end

def filters_from_extensions(item)
  filters = item.identifier.exts.map do |ext| 
    case ext
    when 'erb'
      :erb
    when 'md'
      :kramdown
    else
      nil
    end
  end
  filters.compact.reverse
end

def has_sidenav_content?
  environment('environment.name') ||
    environment('organisation.name') ||
    !contacts.empty? ||
    !links.empty?
end

def override(items_or_layouts)
  overrides = items_or_layouts.select { |i| i[:__override__] }
  overrides.each do |override|
    items_or_layouts.delete_if do |i|
      i.identifier == override[:__overridden_identifier__]
    end
    override.identifier = override[:__overridden_identifier__]
  end
end
