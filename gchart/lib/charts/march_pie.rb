require File.expand_path(File.dirname(__FILE__) + "/../gchart")

# If the first argument to `ruby` is this file.
if $0 == __FILE__
  # Execute some stuff.
  puts 'required files loaded'
end

# Define local variables
chart_title  = "March Cumulative Standalone Net Sales through 03/31|1,132 units, net Y274,670"
sales_array = [77613,67425,52768,39675,15799,7728,7047,6615]
labels_array = ["TOEIC 600 (28%)", "TOEIC Kanzen (25%)", "Kiso Core 2000 (19%)", "TOEIC 800 (14%)", "Oshigoto (6%)", "Kiso Practical (3%)", "Kiso Survival (3%)", "Kiso Mastery (2%)"]
colors_array = %w(3072F3 FF0000 008000 49188F 3399CC FF9900 E8EEF7 FFEAC0)

puts 'local variables generated'

chart = GChart.pie do |g|
  g.data = sales_array
  g.colors = colors_array
  g.legend = labels_array
  
  g.width  = 660
  g.height = 403
  
  g.extras = {
    "chds"   => "0,77613",         # Custom scaling
    "chp"    => "4.69",            # Pie chart rotation in radians
    "chts"   => "000000,16.8",     # Title styles.
    "chxt"   => "x",               # Chart type.
    "chxs"   => "0,000000,13.5"    # Label styles.
  }
  
  g.title = chart_title
  
end

puts "chart generated"

url =  chart.to_url

puts "url generated"
puts url