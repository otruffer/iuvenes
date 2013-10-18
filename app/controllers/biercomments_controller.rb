class BiercommentsController < PruegelEntityController
  # To change this template use File | Settings | File Templates.
 TYPE = 'Biercomment';
  attr_accessor :type

 def get_type
   return TYPE
 end
end