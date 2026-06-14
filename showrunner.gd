extends Node
var raceScene = preload("res://race.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var raceInst = raceScene.instantiate()
	add_child(raceInst)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
