extends Control
var buttonArray = ["Button","Button2","Button3","Button4","Button5","Button6","Button7","Button8"]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func feed_bookie(horses):
	var i = 0
	for horse in horses:
		var thisButton = get_node(buttonArray[i])
		thisButton.text = horse
		i += 1



func _on_win_check_toggled(toggled_on: bool) -> void:
	pass


func _on_place_check_toggled(toggled_on: bool) -> void:
	pass


func _on_show_check_toggled(toggled_on: bool) -> void:
	pass
