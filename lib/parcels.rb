class Parcel
  define_method(:initialize) do |width, length, height|
    @width = width
    @length = length
    @height = height
    @dimensions = [width, length, height]
    @cost = 0.00
  end

  define_method(:parcel?) do
    !(@dimensions.include?(0))
  end

  define_method(:volume) do
    (@width*(@length))*(@height)
  end

  define_method(:cost_to_ship) do |distance, weight, speed, gift_wrap|
    if weight > 2.0
      @cost = distance * 0.50
    else
      @cost = distance * 0.25
    end
    if speed == 'fast'
      @cost = @cost * 2.0
    elsif speed == 'slow'
      @cost = @cost
    end
    if volume() > 20
      @cost = @cost * 1.5
    end
    if gift_wrap == "Yes"
      @cost = @cost + surface_area() * 0.01
    end
    @cost
  end

  define_method(:surface_area) do
    base = @width * @length
    face = @height * @width
    side = @height * @length
    (base * 2) + (face * 2) + (side *2)
  end

  define_method(:discount) do |code|
    code_table = {"ABC" => 5.00, "EPICODUS" => 10.0, "CHEAPO" => 1.00}
    if !(code_table.include?(code))
      discount = 0.0
    else
      discount = code_table.fetch(code)
    end
  end
end
