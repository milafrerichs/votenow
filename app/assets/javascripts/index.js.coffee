# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$ ->
  if $('#ranking').length > 0
    data = gon.data
    x_scale = d3.scale.linear().domain([0,5]).range([0,400])
    y_scale = d3.scale.ordinal().domain(data.map((d) -> d.name)).rangeRoundBands([0,600],.1)
    y_axis_scale = d3.scale.ordinal().domain(d3.range(1,data.length+1)).rangeRoundBands([0,600],.1)

    svg = d3.select('#ranking').attr('width', 420).attr('height', 640)
    charts = d3.select('.graphs').attr('transform', 'translate(20,0)')

    chart = charts.selectAll('rect')
      .data(data)
      .enter()
      .append('rect')
      .attr('x', (d) -> 0)
      .attr('y', (d) -> y_scale(d.name))
      .attr('width', (d) -> x_scale(d.score))
      .attr('height', (d) -> y_scale.rangeBand())
    charts.selectAll("text").data(data).enter().append("text")
      .attr("x", (d) -> x_scale(d.score)/2)
      .attr("y", (d) -> y_scale(d.name)+ y_scale.rangeBand()/2)
      .attr("text-anchor","middle")
      .text((d) -> d.name)

    y_axis = d3.svg.axis().scale(y_axis_scale).ticks(data.length).orient('left')
    y_axis = d3.select('g.axis.y').attr('transform', 'translate(20,0)').call(y_axis)
