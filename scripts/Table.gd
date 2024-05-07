extends Node2D

@export var CardsOnTable: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _card_drawn_from_deck(drawnCard: Card):
	CardsOnTable.push_back(drawnCard)
	CheckPredator(drawnCard)
	CheckDoubleCards(drawnCard)

func CheckDoubleCards(newCard: Card):
	# Find double card types
	for i in range(CardsOnTable.size() - 1):
		if CardsOnTable[i].Type == newCard.Type:
			print("Double card found: " + Card.PiggyType.keys()[newCard.Type] + " at " + str(i))
			# Add left over cards to current player
			if $"../Player1".Active:
				for j in range(i):
					$"../Player1".CardsInHand.push_back(CardsOnTable[j])
			else:
				for j in range(i):
					$"../Player2".CardsInHand.push_back(CardsOnTable[j])
			SwitchPlaerTurn()
			CleanupTable()
			break

func CheckPredator(newCard: Card):
	if newCard.Type == Card.PiggyType.Predator:
		print("Predator!")
		CleanupTable()
		SwitchPlaerTurn()

func CleanupTable():
	CardsOnTable.clear()
	for uiCardOnTable in $"../TableUi/VBoxContainer/Cards/GridContainer".get_children():
		$"../TableUi/VBoxContainer/Cards/GridContainer".remove_child(uiCardOnTable)
		uiCardOnTable.queue_free()
	
func SwitchPlaerTurn():
	$"../Player1".Active = !$"../Player1".Active
	$"../Player2".Active = !$"../Player2".Active
