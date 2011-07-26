require File.expand_path(File.dirname(__FILE__) + "/../gchart")

dates_array = ['Monday', 'Tuesday', 'Wednesday']
data_array1 = [1,50,100]
data_array2 = [250,500,750]
data_array3 = [50,70,90]

chart = GChart.line do |g|
  g.data   = [data_array1, data_array2, data_array3]
  g.colors = [:red,        :green,      :blue]
  g.legend = ["Set 1",     "Set 2",     "Set 3"]

  g.width  = 950
  g.height = 315

  g.axis(:left) do |a|
    a.range      = 0..100
    a.text_color = :red
    a.font_size  = 9
  end

  g.axis(:right) do |a|
    a.font_size       = 8
    a.label_positions = [250, 500, 750]
    a.labels          = %w(250 500 750)
    a.range           = 0..1000
    a.text_alignment  = :right
    a.text_color      = :green
  end

  g.axis(:top) do |a|
    a.labels    = %w(2008)
    a.label_positions = [50]
  end

  bottom1        = g.axis :bottom
  bottom1.labels = dates_array

  bottom1.range_markers = [
    [0..33.33,     'ff000044'],
    [33.33..66.67, '00ff0044'],
    [66.67..100,   '0000ff44']
  ]

  # We "manually" create our 2nd bottom axis...

  bottom2                 = GChart::Axis.create :bottom
  bottom2.labels          = %w(Dates)
  bottom2.label_positions = [50]

  # ...and therefore need to also add it to our axes "manually".
  g.axes << bottom2
end

url = chart.to_url

puts url
