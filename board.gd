extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const COLUMNS = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
const PIECE = preload("res://Piece.tscn")

var board_state = [[{},{},{},{},{},{},{},{}],
[{},{},{},{},{},{},{},{}],
[{},{},{},{},{},{},{},{}],
[{},{},{},{},{},{},{},{}],
[{},{},{},{},{},{},{},{}],
[{},{},{},{},{},{},{},{}],
[{},{},{},{},{},{},{},{}],
[{},{},{},{},{},{},{},{}]]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#place_tiles()

#take a chess board position in as a string and return the element in the 2d array board_state
func get_board_position(spot : String):
	if spot:
		var index = COLUMNS.find(spot[0])
		if index > 0 && int(spot[1]) > 0:
			return Vector2(index, int(spot[1]) - 1)
	return null

#take a board position in as a string and put a piece(second arg) at the corrosponding element in board_state
func set_board_position(spot : String, piece = {}):
	if spot:
		var index = COLUMNS.find(spot[0])
		if index > 0 && int(spot[1]) > 0:
			board_state[int(spot[1]) - 1][index] = piece
			return 0
	return -1

#call to spawn a piece on the board
#func put(spot = "A1"):
#	var newpiece = PIECE.instance()
#	newpiece.position = coords(spot)
#	self.add_child(newpiece)
#
##puts a piece at every spot on the map
#func place_tiles():
#	var a = 0
#	var b = 0
#	while a < 8:
#		print(a)
#		while b < 8:
#			put(COLUMNS[a] + String(b + 1))
#			b += 1
#		a += 1
#		b = 0

#return the pixel coordinates at the center of a given chess position ex. "b7"
func coords(spot : String):
	var x = self.rect_size.x / 16
	var y = self.rect_size.y / 16
	var index = COLUMNS.find(spot[0])
	if spot && index > 0:
		x += (self.rect_size.x / 8) * index
	if spot && int(spot[1]) > 1:
		y += (self.rect_size.y / 8) * (int(spot[1]) - 1)
	return Vector2(x,y)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
