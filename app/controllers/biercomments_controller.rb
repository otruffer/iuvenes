class BiercommentsController < PruegelEntityController
  # To change this template use File | Settings | File Templates.
 TYPE = 'Biercomment';
  attr_accessor :type

 def get_type
   return TYPE
 end

  def get_new(params = false)
    if(params != false)
      return Biercomment.new(params[:biercomment])
    else
      return Biercomment.new
    end
  end
end