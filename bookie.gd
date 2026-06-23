extends Control
var buttonArray = ["Button","Button2","Button3","Button4","Button5","Button6","Button7","Button8"]
var activeHorses
var playerMoney
signal betMade(ammount, betType, horse, odds)
signal doneWithBookie()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func feed_bookie(horses, money):
	activeHorses = horses
	playerMoney = money
	$Panel/HSlider.max_value = money
	$Label.text = "Ł" + str(money)
	var i = 0
	for horse in horses:
		var thisButton = get_node(buttonArray[i])
		thisButton.text = horse
		i += 1



func _on_win_check_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		var curInfo = activeHorses[$Panel/Label.text].record
		$Panel/Label6.text = str(curInfo)


func _on_place_check_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		var curInfo = activeHorses[$Panel/Label.text].record
		$Panel/Label6.text = str(curInfo * 0.8)


func _on_show_check_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		var curInfo = activeHorses[$Panel/Label.text].record
		$Panel/Label6.text = str(curInfo * 0.65)

func horse_button(emittingNode):
	var sumting = get_node(emittingNode)
	$Button.disabled = true
	$Button2.disabled = true
	$Button3.disabled = true
	$Button4.disabled = true
	$Button5.disabled = true
	$Button6.disabled = true
	$Button7.disabled = true
	$Button8.disabled = true
	$Panel/winCheck.button_pressed = true
	$Panel.show()
	$Panel/HSlider.value = 0.0
	$Panel/Label.text = sumting.text
	$Panel/Label6.text = str(activeHorses[sumting.text].record)
	$Panel/Label5.text = "Ł0.0"


func _on_button_2_pressed() -> void:
	$Button.disabled = false
	$Button2.disabled = false
	$Button3.disabled = false
	$Button4.disabled = false
	$Button5.disabled = false
	$Button6.disabled = false
	$Button7.disabled = false
	$Button8.disabled = false
	$Panel.hide()


func _on_h_slider_value_changed(value: float) -> void:
	$Panel/Label5.text = "Ł" + str(value)


func _on_button_pressed() -> void:
	var wager = float($Panel/Label5.text.trim_prefix("Ł"))
	if wager != 0.0:
		var horseName = $Panel/Label.text
		var betType
		if $Panel/winCheck.button_pressed == true:
			betType = 0
		if $Panel/placeCheck.button_pressed == true:
			betType = 1
		if $Panel/showCheck.button_pressed == true:
			betType = 2
		playerMoney -= wager
		$Label.text = "Ł" + str(playerMoney)
		$Panel/HSlider.max_value -= wager
		var curOdds = float($Panel/Label6.text)
		betMade.emit(wager,betType,horseName,curOdds)
		$Button.disabled = false
		$Button2.disabled = false
		$Button3.disabled = false
		$Button4.disabled = false
		$Button5.disabled = false
		$Button6.disabled = false
		$Button7.disabled = false
		$Button8.disabled = false
		$Panel.hide()


func _on_button_9_pressed() -> void:
	doneWithBookie.emit()
