class ResultSetPresenter

protected

  def metadata_for_paginated_array(arr)

    # [:total, :start_index, :page_size, :current_page, :pages].each do |key|
    #   presented[key.to_s] = @result_set.send(key)
    # end

    return nil unless arr.respond_to?(:current_page)
    { total: arr.total_count,
      current_page: arr.current_page,
      #start_index:  ?? used in gov.uk
      pages: arr.total_pages,
      page_size: arr.default_per_page 
    }
  end

end