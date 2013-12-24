exports.index = (req, res) ->
  res.render "index",
    title: "macross Presentation Stubulator"

status =
  show: (req, res) ->
    res.render "status/show",
      title: "macross presentation-stubulator status"

exports.status = status
