extends Node2D

@export var Active: bool = false
@export var CardsInHand: Array = []
@export var TotalScore: int = 0
@onready var Table = $"../Table"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Table.CardsOnTable.size() == 0 or Active == false:
		$"../TableUi/VBoxContainer/Player2/EndTurn".disabled = true
	if Table.CardsOnTable.size() > 0 and Active == true:
		$"../TableUi/VBoxContainer/Player2/EndTurn".disabled = false

func _on_end_turn_pressed():
	print("Player2 ended turn. He got " + str(Table.CardsOnTable.size()) + " cards.")
	for card: Card in Table.CardsOnTable:
		CardsInHand.append(card)
	Table.CleanupTable()
	Table.SwitchPlaerTurn()

func _on_show_cards_pressed():
	print("Player 2 Cards in hand:")
	var printOutput := "- %s : %s"
	for card: Card in CardsInHand:
		print(printOutput % [Card.PiggyType.keys()[card.Type], card.Value])


# I know this is realy messy but it works. Will be optimized when... well... probably never.
func CalculateScoreForCurrentRun():
	var einsteinMaxValue = 0
	var phoebeMaxValue = 0
	var ciriMaxValue = 0
	var legolasMaxValue = 0
	var trissMaxValue = 0
	var emmaMaxValue = 0
	var taurielMaxValue = 0
	var aryaMaxValue = 0
	var teddyMaxValue = 0
	var nackedeiMaxValue = 0

	for card: Card in CardsInHand:
		match card.Type:
			1:
				if card.Value > einsteinMaxValue:
					einsteinMaxValue = card.Value
			2:
				if card.Value > phoebeMaxValue:
					phoebeMaxValue = card.Value
			3:
				if card.Value > ciriMaxValue:
					ciriMaxValue = card.Value
			4:
				if card.Value > legolasMaxValue:
					legolasMaxValue = card.Value
			5:
				if card.Value > trissMaxValue:
					trissMaxValue = card.Value
			6:
				if card.Value > emmaMaxValue:
					emmaMaxValue = card.Value
			7:
				if card.Value > taurielMaxValue:
					taurielMaxValue = card.Value
			8:
				if card.Value > aryaMaxValue:
					aryaMaxValue = card.Value
			9:
				if card.Value > teddyMaxValue:
					teddyMaxValue = card.Value
			10:
				if card.Value > nackedeiMaxValue:
					nackedeiMaxValue = card.Value
					
	TotalScore = TotalScore + einsteinMaxValue + phoebeMaxValue + ciriMaxValue + legolasMaxValue + trissMaxValue + emmaMaxValue + taurielMaxValue + aryaMaxValue + teddyMaxValue + nackedeiMaxValue
	$"../TableUi/VBoxContainer/Player2/VBoxContainer/Score".text = "Score: " + str(TotalScore)

