module Paginable
  protected

  def current_page
    (params[:page] || 1).to_i
  end

  def per_page
    (params[:per_page] || 4).to_i
  end

  def meta_attributes(collection)
    {
      current_page: collection.current_page,
      totalItems: collection.total_count,
      itemsPerPage: collection.limit_value
    }
  end
end