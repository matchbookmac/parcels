class Parcel
  define_method(:initialize) do |width, length, height|
    @width = width
    @length = length
    @height = height
    @dimensions = [width, length, height]
  end

  define_method(:parcel?) do
    !(@dimensions.include?(0))
  end

  define_method(:volume) do
    (@width*(@length))*(@height)
  end

  define_method(:cost_to_ship) do |distance, weight, speed|
    cost = 0.0
    if weight > 2.0
      cost = distance * 0.50
    else
      cost = distance * 0.25
    end
    if speed == "fast"
      cost = cost * 2.0
    end
    if volume() > 20
      cost = cost * 1.5
    end
    cost
  end
end
