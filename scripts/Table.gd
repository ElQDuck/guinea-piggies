extends Control

@export var deck: TextureButton
@export var drawn_cards_area: Control
@export var played_card_scene: PackedScene
var cards_on_table: Array[Card] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	deck.card_drawn_from_deck.connect(_place_card_on_table)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _place_card_on_table(card: Card):
	var new_card: Card = Card.new(card.type, card.value)
	cards_on_table.append(new_card)
	var played_card: Panel = new_card.get_scene()
	## Add card to scene
	drawn_cards_area.add_child(played_card)
	# Animate card drawing
	var deck_position: Vector2 = get_object_global_center_position(deck)
	var cards_area_center_position: Vector2 = drawn_cards_area.get_global_position()
	move_card(played_card, deck_position, cards_area_center_position)
	played_card.flip_card(3)
	_check_double_cards()


func _check_double_cards():
	if cards_on_table.size() > 1:
		var last_card = cards_on_table.back()
		# Find double card types
		for i in range(cards_on_table.size() - 1):
			if cards_on_table[i].type == last_card.type:
				print("Double card found: " + Card.PiggyType.keys()[last_card.type] + " at " + str(i))
				# TODO: Add event what happens after the double card was found -> drop between and add rest to player
				break

#func CheckPredator(newCard: Card):
	#if newCard.Type == Card.PiggyType.Predator:
		#print("Predator!")
		#CleanupTable()
		#if Player1.Active and Player2.CardsInHand.size() > 0:
			#$"../DiceSelectionUi/VBoxContainer/Label".text = "Player 1 Choose the number of cards you want to steal from Player 2."
			#$"../DiceSelectionUi".set_visible(true)
		#if Player1.Active and Player2.CardsInHand.size() == 0:
			#print("Player has no cards in hand. Skip predator event.")
			#SwitchPlaerTurn()
		#if Player2.Active and Player1.CardsInHand.size() > 0:
			#$"../DiceSelectionUi/VBoxContainer/Label".text = "Player 2 Choose the number of cards you want to steal from Player 1."
			#$"../DiceSelectionUi".set_visible(true)
		#if Player2.Active and Player1.CardsInHand.size() == 0:
			#print("Player has no cards in hand. Skip predator event.")
			#SwitchPlaerTurn()


func move_card(card_in_scene: Panel, from: Vector2, to: Vector2):
	var tween = create_tween()
	tween.tween_property(card_in_scene, "global_position", to, 3).from(from)


func get_object_global_center_position(object) -> Vector2:
	var object_global_position: Vector2 = object.get_global_position()
	var object_size: Vector2 = object.get_size()
	var object_center_global_position: Vector2 = object_global_position + object_size / 2
	return object_center_global_position
