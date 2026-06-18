extends Control
signal betsPlaced


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func set_odds(rcvdHorses, nextRace):
	$Label.text = ""
	$Label2.text = ""
	$Label4.text = ""
	$Label5.text = ""
	var count = 0
	for horse in rcvdHorses:
		var thisOne = rcvdHorses[horse]
		if count < 6:
			$Label.text += str(thisOne.record) + "-" + horse + "\n"
		else:
			$Label2.text += str(thisOne.record) + "-" + horse + "\n"
		count += 1
	count = 0
	for horse in nextRace:
		if count < 4:
			$Label4.text += horse + "\n"
		else:
			$Label5.text += horse + "\n"
		count += 1
			
		
			


func _on_button_pressed() -> void:
	betsPlaced.emit()
