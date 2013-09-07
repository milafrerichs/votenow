$ ->
  if $('#application').length > 0
    app_id = $('#application').data('id')
    source = new EventSource("/applications/score_events/#{app_id}")
    source.addEventListener 'message', (e) ->
      render_chart($.parseJSON(e.data))
    data = gon.data
    y_scale = d3.scale.linear()
       .domain([0, 5])
       .range([100, 0])

    x_scale = d3.scale.ordinal()
      .domain(data.map((d)->d.name))
      .rangeRoundBands([0, 800], 1)
    render_chart = (data) ->
      console.log(data)
      x_scale.domain(data.map((d)->d.name))
      update_rects = charts.selectAll('rect')
      .data(data)
      append = charts.selectAll('rect')
      .data(data)
      .enter()
      .append("rect")
      console.log(update_rects)
      set_attributes(append)
      set_attributes(update_rects)

    set_attributes = (rect) ->
      rect
       .attr("x", (d)-> x_scale(d.name))
       .attr("y", (d)-> y_scale(d.score))
       .attr("width", 20)
       .attr("height", (d)-> 100-y_scale(d.score))


    svg = d3.select("#graph")
      .attr('width', 800)
      .attr('height', 150)

    charts = d3.select('g.charts').attr('transform', 'translate(0,0)')

     #.attr("fill",(d)->"rgb(0, 0, " + (d * 10) + ")")


    x_axis = d3.svg.axis().scale(x_scale).orient('bottom')
    axis_x = d3.select('g.axis.x')
      .attr("transform", "translate(0,110)")
      .call(x_axis)
    render_chart(data)

