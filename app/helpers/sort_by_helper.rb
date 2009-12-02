module SortByHelper
# overload SortBy plugin

  def sort_header(field, options = {:label => field.titleize, :current_order => request.params[:order]})
    default_options = {
      :label => field.titleize,
      :current_order => request.params[:order]
    }
    options = default_options.merge(options)
    current_order = (options[:current_order] && options[:current_order].downcase) || 'asc'
    link_order = (current_order == 'desc' && 'asc') || 'desc'
    s = %{
      <th class="sort_header">
        #{link_to(options[:label], url_for(request.params.merge(:page => nil, :order_by => field, :order => link_order)))}
      </th>
    }
  end
end