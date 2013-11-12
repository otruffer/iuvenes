class BiercommentsController < PruegelEntityController
  # To change this template use File | Settings | File Templates.
 TYPE = 'Biercomment';
  attr_accessor :type

 def get_type
   return TYPE
 end

 # @param [Object] params
 def get_new(params = false)
    if (params != false) then
      return Biercomment.new(params[:biercomment])
    else
      Biercomment.new
    end
  end

  def parse_entry_params(params)
    return params[:biercomment]
  end
end