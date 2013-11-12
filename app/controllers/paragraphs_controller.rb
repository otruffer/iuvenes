class ParagraphsController < PruegelEntityController
  # To change this template use File | Settings | File Templates.
  TYPE = 'Paragraph';
  attr_accessor :type

  def get_type
    return TYPE
  end

  def get_new(params = false)
    if(params != false)
      return Paragraph.new(params[:paragraph])
    else
      return Paragraph.new
    end
  end


  def parse_entry_params(params)
    return params[:paragraph]
  end
end