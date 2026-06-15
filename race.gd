extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func get_horses(horses):
	var horseNames = horses.keys()
	$Label.text = horseNames[0]
	$Label2.text = horseNames[1]
	$Label3.text = horseNames[2]
	$Label4.text = horseNames[3]
	$Label5.text = horseNames[4]
	$Label6.text = horseNames[5]
	$Label7.text = horseNames[6]
	$Label8.text = horseNames[7]
