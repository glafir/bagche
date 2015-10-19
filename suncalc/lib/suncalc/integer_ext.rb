class Integer
  include Math
 
  def cos
    super(self*PI/180)
  end
 
  def sin
    super(self*PI/180)
  end
end
