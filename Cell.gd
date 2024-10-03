extends SpinBox

@export var row = -1;
@export var col = -1;
@export var square = -1;

## only call it once
## after assagining 
## [this.row],[this.col] and [this.square]
func group_update():
	add_to_group("r"+str(row))
	add_to_group("c"+str(col))
	add_to_group("s"+str(square))

func _value_changed(new_value: float) -> void:
	if value > 0:
		for group in get_groups():
			remove_from_group(group)
			for node in get_tree().get_nodes_in_group(group):
				if node.value == new_value:
					value = 0
					add_to_group(group)
					return 
			add_to_group(group)
