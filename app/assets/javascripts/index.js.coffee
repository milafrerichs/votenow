# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$ ->
  if $('#ranking').length > 0
    data = [
      {name: 'App2', score: 5.0},
      {name: 'App3', score: 4.7},
      {name: 'App4', score: 3.3},
      {name: 'App5', score: 2.0},
      {name: 'App6', score: 1.0}
    ]
    x_scale = d3.scale.linear().domain([0,5]).range([0,400])
    y_scale = d3.scale.ordinal().domain(data.map((d) -> d.name)).rangeRoundBands([0,600],.1)
    y_axis_scale = d3.scale.linear().domain([1,data.length]).range([0,600])

    svg = d3.select('#ranking').attr('width', 420).attr('height', 600)
    charts = d3.select('.graphs').attr('transform', 'translate(20,0)')

    charts.selectAll('rect')
      .data(data)
      .enter()
      .append('rect')
      .attr('x', (d) -> 0)
      .attr('y', (d) -> y_scale(d.name))
      .attr('width', (d) -> x_scale(d.score))
      .attr('height', (d) -> y_scale.rangeBand())
      .text((d) -> d.name)

    y_axis = d3.svg.axis().scale(y_axis_scale).ticks(data.length).orient('left')
    y_axis = d3.select('g.axis.y').attr('transform', 'translate(20,0)').call(y_axis)
