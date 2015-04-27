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
end
