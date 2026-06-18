extends Node
#var raceScene = preload("res://race.tscn")

var HORSES

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HORSES = generate_horses(12)
	var todaysRace = prepare_race(HORSES)
	$Race.get_horses(todaysRace)
	$Race.visible = true
	#var raceInst = raceScene.instantiate()
	#add_child(raceInst)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func new_game():
	pass

func prepare_race(horseList):
	var nameList : Array
	for horseName in horseList:
		nameList.append(horseName)
	nameList.shuffle()
	nameList.resize(8)
	var returnDict : Dictionary
	for horse in nameList:
		returnDict[horse] = horseList[horse]
	return returnDict
		

func generate_horses(horseQty : int):
	var names = generate_names(horseQty)
	var genHorses : Dictionary
	for horse in horseQty:
		var horseName : String = names[horse]
		var horseStats : Dictionary = {
			"maxSpeed" : (20.0 + randf_range(-0.25,0.25)),
			"cruiseSpeed" : (13.0 + randf_range(-0.25,0.25)),
			"stamina" : (6.0 + randf_range(0,0.5)),
			"recoveryTime" : (10.0 + randf_range(-0.25,0.25)),
			"transitionTime" : (5.0 + randf_range(-1,5)),
			"luck" : (5.0 + randf_range(-0.5,0.5)),
			"record" : 2.0}
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
		"According to",
		"In the Name of",
		"It's Pronounced",
		"A Horse Named",
		"Please Don't Call Me",
		"In Regards to",
		"In Accordance With the Will of"]
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
		"Spanish",
		"Smashing",
		"Reconstituted",
		"Steady",
		"Obtuse",
		"Stunning",
		"Lumpen",
		"Majestic",
		"Beautiful",
		"Staggering",
		"Jazz"]
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
		"Tosser",
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
		"Cookies",
		"Disaster",
		"Rambler",
		"Bits",
		"Artillery",
		"Grit",
		"Blood",
		"Teeth",
		"Stump",
		"Foot",
		"Disc",
		"Chocodile"]
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
			


func _on_race_race_results(results: Array) -> void:
	$Race.hide()
	var racerMod = [-0.15,-0.1,-0.05,0.0,0.0,0.25,0.5,1.0]
	var i = 0
	for racer in results:
		HORSES[racer].record += racerMod[i]
		if HORSES[racer].record < 1.0:
			HORSES[racer].record = 1.0
		i += 1
	#print(HORSES)
	#$Race.get_horses(HORSES)
	#$Race.visible = true
	$bet.show()
	var raceHorses = prepare_race(HORSES)
	$Race.get_horses(raceHorses)
	$bet.set_odds(HORSES, raceHorses)


func _on_bet_bets_placed() -> void:
	$bet.hide()

	$Race.visible = true
