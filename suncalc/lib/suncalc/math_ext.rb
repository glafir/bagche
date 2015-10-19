class Fixnum
  def method_missing(name)
    Math.send(name, self)
  end
end
