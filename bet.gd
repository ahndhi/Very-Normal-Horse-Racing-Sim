extends Control
signal betsPlaced


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func set_odds(rcvdHorses):
	$Label.text = ""
	for horse in rcvdHorses:
		var thisOne = rcvdHorses[horse]
		$Label.text += horse + " - " + str(thisOne.record) + "\n"


func _on_button_pressed() -> void:
	betsPlaced.emit()
