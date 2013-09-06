$ ->
  data = [
    {name: 'Category Name', score: 2.3},
    {name: 'Category Name', score: 4.3},
    {name: 'Category Name', score: 2.6},
    {name: 'Category Name', score: 1.3},
    {name: 'Category Name', score: 2.3}
  ]

  y_scale = d3.scale.linear()
     .domain([0, 5])
     .range([100, 0])

  svg = d3.select("#graph")
    .attr('width', 50 * data.length)
    .attr('height', 100)

  charts = d3.select('g.charts').attr('transform', 'translate(0,0)')

  charts.selectAll('rect')
   .data(data)
   .enter()
   .append("rect")
   .attr("x", (d, i)-> i*50+"px")
   .attr("y", (d)->d-5)
   .attr("width", 20)
   .attr("height", (d)-> y_scale(d.score))
   #.attr("fill",(d)->"rgb(0, 0, " + (d * 10) + ")")


