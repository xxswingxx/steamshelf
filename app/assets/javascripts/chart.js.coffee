drawChart = () ->
  data = google.visualization.arrayToDataTable([
    [
      "Task"
      "Hours per Day"
    ]
    [
      "Played"
      $('#chart_div').data('total') - $('#chart_div').data('never-played')
    ]
    [
      "Never played"
      $('#chart_div').data('never-played')
    ]

  ])
  options = title: "Correlation"
  chart = new google.visualization.PieChart($('#chart_div')[0])
  chart.draw data, options
  return


google.load("visualization", "1", {packages:["corechart"]});

$(document).ready () ->
  drawChart()