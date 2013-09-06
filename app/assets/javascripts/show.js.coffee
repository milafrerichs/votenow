$ ->
  data = gon.data
  console.log(data)
  y_scale = d3.scale.linear()
    .domain([0, 5])
    .range([100, 0])

  x_scale = d3.scale.ordinal()
    .domain(data.map((d)->d.name))
    .rangeRoundBands([0, 800], 1)

  svg = d3.select("#graph")
    .attr('width', 800)
    .attr('height', 150)

  charts = d3.select('g.charts').attr('transform', 'translate(0,0)')

  charts.selectAll('rect')
   .data(data)
   .enter()
   .append("rect")
   .attr("x", (d)-> x_scale(d.name))
   .attr("y", (d)-> y_scale(d.score))
   .attr("width", 20)
   .attr("height", (d)-> 100-y_scale(d.score))
   #.attr("fill",(d)->"rgb(0, 0, " + (d * 10) + ")")


  x_axis = d3.svg.axis().scale(x_scale).orient('bottom')
  axis_x = d3.select('g.axis.x')
    .attr("transform", "translate(0,110)")
    .call(x_axis)
