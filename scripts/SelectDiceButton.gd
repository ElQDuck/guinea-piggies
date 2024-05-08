extends Button

@onready var Table = $"../../../Table"
@onready var Player1 = $"../../../Player1"
@onready var Player2 = $"../../../Player2"
@onready var Dice1 = $"../HBoxContainer/1"
@onready var Dice2 = $"../HBoxContainer/2"
@onready var Dice3 = $"../HBoxContainer/3"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !Dice1.is_pressed() and !Dice2.is_pressed() and !Dice3.is_pressed():
		self.disabled = true
	else:
		self.disabled = false
	
	# If the player has les cards than 3 -> only make as much selections available as cards in hand
	# If the player has no card this dialog should not apear.
	var activePlayer = Table.GetActivePlayer()
	match activePlayer.CardsInHand.size():
		1:
			Dice2.disabled = true
			Dice3.disabled = true
		2:
			Dice3.disabled = true


func _on__toggled_1(toggled_on):
	if toggled_on:
		Dice2.set_pressed_no_signal(false)
		Dice3.set_pressed_no_signal(false)


func _on__toggled_2(toggled_on):
	if toggled_on:
		Dice1.set_pressed_no_signal(false)
		Dice3.set_pressed_no_signal(false)


func _on__toggled_3(toggled_on):
	if toggled_on:
		Dice1.set_pressed_no_signal(false)
		Dice2.set_pressed_no_signal(false)
		


func _on_self_pressed():
	if Dice1.button_pressed:
		print("1 selected")
		RollDice(1)
	if Dice2.button_pressed:
		print("2 selected")
		RollDice(2)
	if Dice3.button_pressed:
		print("3 selected")
		RollDice(3)
	$"../..".set_visible(false)

func RollDice(selectedDice: int):
	var activePlayer = Table.GetActivePlayer()
	# get a random number between 1 and 6
	var diceRollResult = randi() % 6 + 1
	match diceRollResult:
		1:
			# -1 - One card of the player will be discarded
			var discardedCard: Card = activePlayer.CardsInHand.pick_random()
			activePlayer.CardsInHand.erase(discardedCard)
			print("Active player lost: " + Card.PiggyType.keys()[discardedCard.Type] + " - " + str(discardedCard.Value))
		2:
			# 1
			pass
		3:
			# 3
			pass
		4:
			# 1
			pass
		5:
			# 3
			pass
		6:
			# 2
			pass
