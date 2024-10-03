extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _pressed() -> void:
	var cells = %GridContainer.get_children()
	var zero_cells = []
	for c in cells:
		if c.value == 0:
			zero_cells.append(c)
	print(zero_cells.size())
	assign_numbers(zero_cells)

func assign_numbers(zero_cells):
	var c = 0
	while c < zero_cells.size():
		if c < 0:
			print("error or no solutions")
			break
		var solution = range(zero_cells[c].value+1,10)
		zero_cells[c].value = 0
		while zero_cells[c].value == 0:
			if solution.is_empty():
				c = c-2
				break
			zero_cells[c].value = solution.pop_front()
		c = c+1
