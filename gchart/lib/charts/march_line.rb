require File.expand_path(File.dirname(__FILE__) + "/../gchart")

# If the first argument to `ruby` is this file.
if $0 == __FILE__
  # Execute some stuff.
  puts 'required files loaded'
end

# Define local variables
chart_title  = "March Cumulative Standalone Apps|Previous month: 2,035 units (-61%), net Y0.51 million (-62%)|Implied March: 1,132 units (-44%), net Y0.27 million (-47%)"
units_legend = "Cumulative Units (#)"
sales_legend = "Cumulative Net Sales (JPY MM)"
dates_array = [1, 7, 14, 21, 28, 31]
axis_array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
units_array = [42,75,103,127,170,222,256,291,319,361,393,421,458,481,505,540,566,585,618,673,723,762,792,838,874,910,957,997,1028,1078,1132]
sales_array = [10252,18197,25673,30807,41232,54203,62507,70960,78164,88923,97199,104375,112585,117722,123856,131779,138170,143067,151519,164620,176497,186438,193268,204116,212581,221225,232954,242404,249577,261614,274670]
dates_label_positions = [1, 7, 14, 21, 28, 31]
units_label_positions = [0, 500, 1000, 1500, 2000, 2500, 3000]
sales_label_positions = [0, 100000, 200000, 300000, 400000, 500000, 600000, 700000, 800000]
dates_labels = %w(1 7 14 21 28 31)
units_labels = %w(0 500 1000 1500 2000 2500 3000)
sales_labels = %w(0 100000 200000 300000 400000 500000 600000 700000 800000)

puts 'local variables generated'

#GChart.encode(:text, 31, 274670)

chart = GChart.xyline do |g|
  g.data      = [axis_array, units_array, axis_array, sales_array]
  g.colors    = [:blue,      :red]
  g.legend    = [units_legend, sales_legend]
  
  g.width  = 660
  g.height = 440
  
  g.axis(:left) do |a|
    a.font_size       = 16.8
    a.text_color      = :blue
    a.label_positions = units_label_positions
    a.labels          = units_labels
    a.range           = 0..3000
    a.text_alignment  = :right
  end
  
  g.axis :right do |a|
    a.font_size       = 16.8
    a.text_color      = :red
    a.label_positions = sales_label_positions
    a.labels          = sales_labels
    a.range           = 0..800000
    a.text_alignment  = :left
  end
  
  g.axis :bottom do |a|
    a.font_size       = 16.8
    a.text_color      = :green
    a.label_positions = dates_label_positions
    a.labels          = dates_array
    a.range           = 1..31
  end
  
  # We "manually" create our 2nd bottom axis...
  
  bottom2                 = GChart::Axis.create :bottom
  bottom2.labels          = %w(Dates)
  bottom2.label_positions = [50]
  
  # ...and therefore need to also add it to our axes "manually".
  g.axes << bottom2
  
  g.title = chart_title

  g.extras = {
    "chts"  => "000000,16.8",              # Title styles.
    "chdlp" => "b",                        # The position of the legend, and order of the legend entries.
    "chdls" => "000000,16.8",              # Legend styles.
    "chxr"  => "0,1,31|1,0,3000|2,0,0.8",  # Value range for each axis.
    "chxt"  => "x,y,r",                    # Which axes to display.
    "chxtc" => "0,7|1,7|2,7",              # Length of tick marks for a specific axis.
    "chds"  => "1,31,0,3000,1,31,0,800000",     # Scale the numeric value displayed.
    "chg"   => "0,16.60",                       # Grid lines.
    "chls"  => "3|3",                           # Line styles.
    "chm"   => "d,0000FF,0,-1,10|s,FF0000,1,-1,10",   # Shape markers.
    "chxr"  => "0,1,31|1,0,3000|2,0,0.8",             # Axis ranges.
    "chxp"  => "0,1,7,14,21,28,31|1,500,1000,1500,2000,2500,3000|2,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8", # Axis label positions.
    "chxs"  => "0,000000,16.8,0,lt,000000,000000|1N*s*,000000,16.8,0,lt,000000,000000|2N*cJPY*Mil,000000,16.8,0,lt,000000,000000" # Axis styles.
  }
  
end

puts 'chart generated'

url = chart.to_url            # generate the chart's URL, or

puts 'url generated'
puts url

#g.fetch             # get the bytes, or
#g.write "foo.png"   # write to a file (defaults to "chart.png")