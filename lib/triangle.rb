class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    correct_triangle 
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  #helper method
  def correct_triangle
    #creates an array of boolean values. if any return false, the method will return false.
    #if the array has a false value in it, Triangle Error will run
    good_triangle = [(a + b > c), (a + c > b), (b + c > a)]
    #test if a,b or c is zero or neg.
    #if any of them are zero or neg, array is falsey and the error is raised. 
    [a, b, c].each { |x| good_triangle << false if x <= 0 }
    raise TriangleError if good_triangle.include?(false)
  end


class TriangleError < StandardError
end

end