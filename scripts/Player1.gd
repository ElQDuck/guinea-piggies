extends Node2D

@export var Active: bool = true
@export var CardsInHand: Array = []
@onready var Table = $"../Table"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Table.CardsOnTable.size() == 0 or Active == false:
		$"../TableUi/VBoxContainer/Player1/EndTurn".disabled = true
	if Table.CardsOnTable.size() > 0 and Active == true:
		$"../TableUi/VBoxContainer/Player1/EndTurn".disabled = false

func _on_end_turn_pressed():
	print("Player1 ended turn")
	print("He got:")
	print(Table.CardsOnTable)
	Table.CleanupTable()
	Table.SwitchPlaerTurn()

func _on_show_cards_pressed():
	print("Player 1 Cards in hand:")
	var printOutput := "- %s : %s"
	for card: Card in CardsInHand:
		print(printOutput % [Card.PiggyType.keys()[card.Type], card.Value])
