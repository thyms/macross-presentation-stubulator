#GET     /forums              ->  index
#GET     /forums/new          ->  new
#POST    /forums              ->  create
#GET     /forums/:forum       ->  show
#GET     /forums/:forum/edit  ->  edit
#PUT     /forums/:forum       ->  update
#DELETE  /forums/:forum       ->  destroy

items = {}

exports.index = (req, res) ->
  res.send items

exports.new = (req, res) ->
  res.send "new items"

exports.create = (req, res) ->
  items[item] = value for item, value of req.body
  res.send 200

exports.show = (req, res) ->
  res.send "show items " + req.params.items

exports.edit = (req, res) ->
  res.send "edit items " + req.params.items

exports.update = (req, res) ->
  res.send "update items " + req.params.items

exports.destroy = (req, res) ->
  res.send "destroy items " + req.params.items
