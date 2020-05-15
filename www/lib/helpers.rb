use_helper Nanoc::Helpers::Rendering

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
