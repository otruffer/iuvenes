class KantsController < PruegelEntityController
  # To change this template use File | Settings | File Templates.
  TYPE = 'Kant';
  attr_accessor :type

  def get_type
    return TYPE
  end

  def get_new(params = false)
    if(params != false)
      return Kant.new(params[:kant])
    else
      return Kant.new
    end
  end


  def parse_entry_params(params)
    return params[:kant]
  end
end