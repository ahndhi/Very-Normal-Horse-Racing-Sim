extends Control
@export var horseName : String
@export var maxSpeed : float
@export var cruiseSpeed : float
@export var stamina : float
@export var recoveryTime : float
@export var transitionTime : float
@export var luck : float
var status : Dictionary = {maxSpeed:0, cruiseSpeed:0, stamina:0, recoveryTime:0, transitionTime:0, luck:0}
var mutations : Array




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
