use_helper Nanoc::Helpers::Rendering

def data_lookup(data_item_name, dotted_key="")
  raw_branding = items["/data/#{data_item_name}.yaml"]
  return if raw_branding.nil?

  keys = dotted_key.split('.')
  keys.reduce(raw_branding) do |accum, key|
    if accum.respond_to?(:[])
      accum[key.to_sym]
    else
      nil
    end
  end
end

def branding(dotted_key="")
  data_lookup('branding', dotted_key)
end

def environment(dotted_key="")
  data_lookup('environment', dotted_key)
end

def raw_contacts
  c = items['/data/contacts.yaml']
  if !c.nil?
    c[:contacts] || []
  end
end

def contacts
  @_contacts ||= items
    .select { |i| i[:kind] == 'contact' }
end

def raw_links
  l = items['/data/links.yaml']
  if !l.nil?
    l[:links] || []
  end
end

def links
  @_links ||= items
    .select { |i| i[:kind] == 'link' }
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
