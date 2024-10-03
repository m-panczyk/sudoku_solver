extends GridContainer

var cell = preload("res://Cell.tscn")

var styles = [
	preload("res://Cell_dark.tres"),
	preload("res://Cell_light.tres"),
]

# Called when the node enters the scene tree for the first time.
func _ready():
	var mod = 0
	for row in 9:
		for col in 3:
			add_3_cells(col+mod,row,col)
		if (row+1)%3 == 0:
			mod = mod+3
			

func add_3_cells(square,row,col):
	for n in 3:
		var cell_instance = cell.instantiate()
		
		cell_instance.row = row
		cell_instance.col = (col*3)+n
		cell_instance.square = square
		cell_instance.group_update()
		
		cell_instance.theme = styles[square%2]
		
		add_child(cell_instance)
