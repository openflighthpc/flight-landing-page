use_helper Nanoc::Helpers::Rendering

def raw_contacts
  c = items['/contacts.yaml']
  if !c.nil?
    c[:contacts] || []
  end
end

def contacts
  @_contacts ||= items
    .select { |i| i[:kind] == 'contact' }
end

def raw_links
  l = items['/links.yaml']
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

def webapps
  items['/webapps.*']
end

def apps
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

def environment
  items['/environment.*']
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
  environment[:name] ||
    environment[:organisation_name] ||
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
