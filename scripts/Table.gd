extends Node2D

@export var Cards: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _card_drawn_from_deck(drawnCard: Card):
	Cards.append(drawnCard)

func CheckDoubleCards(newCard):
	pass
	#for card in Cards:
		#if card.
