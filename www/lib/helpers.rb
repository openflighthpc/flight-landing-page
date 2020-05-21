use_helper Nanoc::Helpers::Rendering

def sidebar
  items['/sidebar.*']
end

def links
  items['/links.yaml'][:links]
end

def installed_apps
  @_installed_apps ||= items
    .select { |i| i[:kind] == 'app' }
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
    has_contacts? ||
    has_links?
end

def has_contacts?
  !environment[:contacts].nil? && !environment[:contacts].empty?
end

def has_links?
  !links.nil? && !links.empty?
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
