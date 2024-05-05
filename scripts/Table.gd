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
				$"../Player1".Active = false
				$"../Player2".Active = true
			else:
				for j in range(i):
					$"../Player2".CardsInHand.push_back(CardsOnTable[j])
				$"../Player1".Active = true
				$"../Player2".Active = false
			# Cleanup table
			CardsOnTable.clear()
			for uiCardOnTable in $"../TableUi/VBoxContainer/Cards/GridContainer".get_children():
				$"../TableUi/VBoxContainer/Cards/GridContainer".remove_child(uiCardOnTable)
				uiCardOnTable.queue_free()
			break
