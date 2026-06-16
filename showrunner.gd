extends Node
#var raceScene = preload("res://race.tscn")

var HORSES

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HORSES = generate_horses(8)
	$Race.get_horses(HORSES)
	$Race.visible = true
	#var raceInst = raceScene.instantiate()
	#add_child(raceInst)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func new_game():
	pass

func generate_horses(horseQty : int):
	var names = generate_names(horseQty)
	var genHorses : Dictionary
	for horse in horseQty:
		var horseName : String = names[horse]
		var horseStats : Dictionary = {
			"maxSpeed" : (20.0 + randf_range(-1,1)),
			"cruiseSpeed" : (13.0 + randf_range(-1,1)),
			"stamina" : (6.0 + randf_range(-0.5,2)),
			"recoveryTime" : (10.0 + randf_range(-0.5,2)),
			"transitionTime" : (5.0 + randf_range(-1,5)),
			"luck" : (2.0 + randf_range(-0.5,1))}
		genHorses[horseName] = horseStats
	return(genHorses)

func generate_names(nameQty : int):
	var firstName : Array = [
		"Daddy\'s Little",
		"Grandmother\'s",
		"The Shareholder\'s",
		"Fran\'s",
		"The People\'s",
		"Her Majesty,",
		"The Horse Formerly Known as",
		"Duke of",
		"Doctor",
		"Father",
		"Scurrying upon",
		"Looking at",
		"Father of",
		"Accountant for",
		"Unfortunately,",
		"Dashing towards",
		"Adopted by",
		"Sponsored by",
		"On Behalf of",
		"Protectorate of",
		"The",
		"Sincerely,",
		"Ole\'",
		"According to"]
	var secondName : Array = [
		"Spider",
		"Screeching",
		"Cuddle Bug",
		"Flaming",
		"Fading",
		"Shimmering",
		"Uncle",
		"Peepaw",
		"Mama",
		"Fingerling",
		"Tiny",
		"Sweltering",
		"Caterwauling",
		"Simpering",
		"Christmas",
		"Left-Handed",
		"Auspicious",
		"Pyrrhic",
		"Star-Studded",
		"Bene Geserit",
		"Scrambled",
		"Broken",
		"Unhoused",
		"Unhappy",
		"Gushing",
		"Randy",
		"Forgettable",
		"Breathtaking",
		"Delirious",
		"Delicious",
		"Agressive",
		"Wild",
		"Troubled",
		"Destroying",
		"Stewed",
		"Strawberry",
		"Steady",
		"Wet",
		"Sea",
		"Spanish"]
	var thirdName : Array = [
		"Dome",
		"Nightmare",
		"Basket",
		"Heart Attack",
		"Spike",
		"Nuzzler",
		"Spoon",
		"Fern",
		"Matchstick",
		"Wildcard",
		"Truncheon",
		"Blackjack",
		"Eagle",
		"Knife",
		"Riot",
		"Hootenany",
		"Cheeseburger",
		"Mike",
		"#4 w/ a Diet Coke",
		"Truck",
		"Trout",
		"Turkey",
		"Skin Tag",
		"Rootkiller",
		"Vestibule",
		"Zola",
		"Nickel",
		"Cart Token",
		"Dog",
		"Lightning",
		"Sparkle Ball",
		"Paws",
		"Water",
		"Pretzel Bender",
		"Bunion",
		"Flapjack",
		"Spice Toes",
		"Refrigerator",
		"Worms",
		"Snake Charmer",
		"Mistake",
		"Ogre",
		"Gravy",
		"Straps",
		"Dancer",
		"Cheese",
		"Witch",
		"Cookies"]
	firstName.shuffle()
	secondName.shuffle()
	thirdName.shuffle()
	var returnList : Array
	for horse in nameQty:
		var addThird = randi_range(0, 2)
		if addThird == 0 && firstName:
			returnList.append(firstName.pop_front() + " " + secondName.pop_front() + " " + thirdName.pop_front())
		else:
			returnList.append(secondName.pop_front() + " " + thirdName.pop_front())
	return(returnList)
			
