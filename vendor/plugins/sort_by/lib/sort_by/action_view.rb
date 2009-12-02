module ActionView
  module SortBy
    
    @@default_method_options = {
      :only => [],
      :except => [],
      :titleize => true,
      :also => [],
      :names => {}
    }
    
    @@default_options = {
      :class => 'sort_by',
      :image_type => 'jpg'
    }
    
    def paginated_sort_table(collection, method_options={}, options={}, pagination_options={})      
      method_options = @@default_method_options.merge(method_options)
      options = @@default_options.merge(options)
      
      # Methods may be passed in as solitary values, convert to array.
      method_options[:only] = [*method_options[:only]]
      method_options[:except] = [*method_options[:except]]
      method_options[:also] = [*method_options[:also]]
      
      methods = method_options[:only] if !method_options[:only].empty?
      if methods.nil?
        if collection.first.respond_to?(:attributes)
          methods = collection.first.attributes.keys
          methods.delete("id")
          methods.unshift("id")
        end
      end
      
      methods ||= []
      
      methods << method_options[:also] if !method_options[:also].empty?
      methods -= method_options[:except].map!(&:to_s) if !method_options[:except].empty?
      
      # Methods may be passed in as symbols, convert to string.
      [*methods].map!(&:to_s)
      
      links = will_paginate(collection, pagination_options)
      o = links
      # There may be no page links.
      o ||= ""
      o += "\n<table class='#{options[:class]}'>
  <thead>
    <tr>\n"
      asc = params[:order] == "asc"
      first = collection.first
      methods.each do |method|
        title = method_options[:names][method] || [*method.split(".")].last
        title = title.titleize if method_options[:titleize]
        if first.respond_to?(method)
          order = asc && request.params[:sort_by] == method ? "desc" : "asc"
          o += "      
          <td>
            #{link_to(title, url_for(request.params.merge(:sort_by => method, :order => order)))}
            #{image_tag("sort_" + order + "." + options[:image_type])}
          </td>\n"
        else
          o += "<td>#{title}</td>"
        end
      end
          
      o += "    </tr>
  </thead>
  <tbody>\n"
      
      for object in collection
        o += "    <tr>\n"
        for method in methods
          o += "      <td>#{[*method.split(".")].inject(object) { |obj, m| obj.send(m) }}</td>\n"
        end
        o += "    </tr>\n"
      end
      
      o += "  </tbody>
</table>\n"  
      o += links.to_s
    end
  end
end