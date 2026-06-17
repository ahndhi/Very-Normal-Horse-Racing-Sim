extends Control
var HorseInfo
var labels = ["Label","Label2","Label3","Label4","Label5","Label6","Label7","Label8"]
var labelColors = [Color(0.929, 0.11, 0.141, 1.0),Color(0.969, 0.58, 0.114, 1.0),Color(1.0, 0.949, 0.0, 1.0),Color(0.0, 0.651, 0.318, 1.0),Color(0.0, 0.682, 0.937, 1.0),Color(0.169, 0.224, 0.565, 1.0),Color(0.498, 0.247, 0.596, 1.0),Color(0.925, 0.0, 0.549, 1.0)]
var horseNodes = ["horse","horse2","horse3","horse4","horse5","horse6","horse7","horse8"]
var go = false
const  MOVE_FACTOR = 0.612
var raceTime = 0.0
var resultsNum = 1
var resultsStr : String
var resultArray : Array
signal raceResults(results : Array)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if go == true:
		raceTime += delta
		for horse in horseNodes:
			var thisHorse = get_node(horse)
			var curHorseSpeed = thisHorse.maxSpeed + randf_range(-2, thisHorse.luck)
			if raceTime > thisHorse.stamina + randf_range(0, thisHorse.luck):
				curHorseSpeed = thisHorse.cruiseSpeed + randf_range(0, thisHorse.luck)
			if raceTime > (thisHorse.stamina + (thisHorse.recoveryTime - randf_range(0, thisHorse.luck))):
				curHorseSpeed = thisHorse.maxSpeed + randf_range(0, thisHorse.luck)
			thisHorse.position.x = thisHorse.position.x + (curHorseSpeed * delta * MOVE_FACTOR * 2)				
			if thisHorse.position.x > 612:
				resultsStr += (str(resultsNum) + ". " + str(thisHorse.horseName) + "\n")
				resultsNum += 1
				horseNodes.erase(horse)
				resultArray.append(thisHorse.horseName)
				#go = false
				#for horsey in horseNodes:
					#var sumHorse = get_node(horsey)
				var thisAnim = thisHorse.get_child(0)
				thisAnim.stop()
				if horseNodes.is_empty():
					go = false
					$Panel2.visible = true
					$Panel2/Label2.text = resultsStr
	#pass#for horses in HorseInfo:
	#0-612
		

func get_horses(horses):
	HorseInfo = horses
	var i = 0
	for horse in horses:
		var horseLabels = get_node(labels[i])
		var thisHorse = get_node(horseNodes[i])
		horseLabels.text = "[color=#" + str(labelColors[i].to_html()) + "]• [/color]" + horse
		thisHorse.horseName = horse
		thisHorse.maxSpeed = horses[horse].maxSpeed
		thisHorse.cruiseSpeed = horses[horse].cruiseSpeed
		thisHorse.stamina = horses[horse].stamina
		thisHorse.recoveryTime = horses[horse].recoveryTime
		thisHorse.transitionTime = horses[horse].transitionTime
		thisHorse.luck = horses[horse].luck
		thisHorse.position.x = 0
		i += 1
		


func _on_button_pressed() -> void:
	$Panel.visible = false
	for horsey in horseNodes:
		var thisHorse = get_node(horsey)
		var thisAnim = thisHorse.get_child(0)
		thisAnim.play('default')
	go = true


func _on_animated_sprite_2d_animation_finished() -> void:
	$Panel.visible = false
	for horsey in horseNodes:
		var thisHorse = get_node(horsey)
		var thisAnim = thisHorse.get_child(0)
		thisAnim.play('default')
	go = true


func _on_endof_race_button_pressed() -> void:
	$Panel2.hide()
	$Panel.show()
	horseNodes = ["horse","horse2","horse3","horse4","horse5","horse6","horse7","horse8"]
	raceTime = 0.0
	resultsNum = 1
	resultsStr = ""
	raceResults.emit(resultArray)
	resultArray = []


func _on_visibility_changed() -> void:
	if $".".visible == true:
		$Panel/AnimatedSprite2D.play("default")
