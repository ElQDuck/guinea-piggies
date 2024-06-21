extends Control

@export var deck: TextureButton
@export var drawn_cards_area: Control
@export var card_placement_area: Control
@export var played_card_scene: PackedScene
var cards_on_table: Array[Card] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	deck.card_drawn_from_deck.connect(_place_card_on_table)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _place_card_on_table(card: Card):
	# During the placement effect the deck button is deactivated.
	# This way the animation wont brake if double clicked.
	deck.set_disabled(true)
	## Add card to table
	var new_card: Card = Card.new(card.type, card.value)
	cards_on_table.append(new_card)
	var played_card: Panel = new_card.get_scene()
	# Add card to scene
	drawn_cards_area.add_child(played_card)
	# Animate card drawing
	var deck_position: Vector2 = get_object_global_center_position(deck)
	var cards_area_center_position: Vector2 = drawn_cards_area.get_global_position()
	var animation_speed = 0.5
	# Calculating the final position of all cards
	# 1. We get the field size to check on how many cards can be places
	var cards_area_size: Vector2 = card_placement_area.get_size()
	# 2. Then we get the size of the cards
	var card_size: Vector2 = played_card.get_card_size()
	# 3. Now we check how many cards can be placed in the are + we add a smal margin
	var position_offset: float = 20
	var offset_to_deck: float = position_offset
	var cards_count_fitting_in_area = floori(cards_area_size.x / (card_size.x + position_offset))
	var area_start_position: float = cards_area_center_position.x - (cards_area_size.x / 2)
	# 4. Now we know if we can just move the cards or have to overlap
	if cards_on_table.size() <= cards_count_fitting_in_area:
		# Cards fit in area
		position_offset = 20
	else:
		# Cards dont fit in are
		position_offset = -(((card_size.x * cards_on_table.size()) - cards_area_size.x + card_size.x) / cards_on_table.size())
	
	for n in range(cards_on_table.size()):
		# First card gets position with offset to Deck
		var card_final_position = 0
		if n == 0:
			card_final_position = Vector2(area_start_position + (card_size.x / 2) + offset_to_deck, cards_area_center_position.y)
		# The next cards get the position depending on first card
		else:
			card_final_position = Vector2(drawn_cards_area.get_child(0).global_position.x + ((card_size.x + position_offset) * n), cards_area_center_position.y)
		var current_card = drawn_cards_area.get_child(n)
		# last card gets also the draw from deck animation
		if n + 1 == cards_on_table.size():
			# First moving the card to the center and making it slightly bigger to have an effect of drawing
			move_card_from_to(current_card, deck_position, DisplayServer.window_get_size() / 2, animation_speed)
			var size_tween = create_tween()
			await size_tween.tween_property(current_card, "scale", Vector2(1.25, 1.25), animation_speed).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_BACK)
			await current_card.flip_card(animation_speed)
			await get_tree().create_timer(0.125).timeout
			# then moving it to the needed position and making it the default size again
			move_card_to(current_card, card_final_position, animation_speed/2)
			var size_tween2 = create_tween()
			size_tween2.tween_property(current_card, "scale", Vector2(1, 1), animation_speed).set_ease(Tween.EASE_IN).from_current()
			# At the end rotate the card slightly to have an effect of drawn cards
			var rotation_tween = create_tween()
			await rotation_tween.tween_property(current_card, "rotation", deg_to_rad(randi_range(-5, 5)), animation_speed)
		else:
			# moving already placed cards to the needed position
			await move_card_to(current_card, card_final_position, animation_speed)
	# move_card(played_card, deck_position, cards_area_center_position, animation_speed)
	# await played_card.flip_card(animation_speed)
	_check_double_cards()
	# After everything is done, a new card can be drawn. The deck button gets activated again.
	deck.set_disabled(false)


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


func move_card_from_to(card_in_scene: Panel, from: Vector2, to: Vector2, speed: float):
	var tween = create_tween()
	tween.tween_property(card_in_scene, "global_position", to, speed).from(from)


func move_card_to(card_in_scene: Panel, to: Vector2, speed: float):
	var tween = create_tween()
	tween.tween_property(card_in_scene, "global_position", to, speed).from_current()


func get_object_global_center_position(object) -> Vector2:
	var object_global_position: Vector2 = object.get_global_position()
	var object_size: Vector2 = object.get_size()
	var object_center_global_position: Vector2 = object_global_position + object_size / 2
	return object_center_global_position


func _move_cards_to_player(cards: Array[Node], player_position: Vector2, speed: float):
	var display_area: Vector2 = DisplayServer.window_get_size() - DisplayServer.window_get_size() / 4
	var center: Vector2 = DisplayServer.window_get_size() / 2
	var overlap: int = 15 * cards.size()
	var card_size_x = cards[0].get_card_size().x
	var needed_card_area: int = cards.size() * (card_size_x - overlap)
	var card_placement_starting_point = DisplayServer.window_get_size().x / 2 - needed_card_area / 2 + card_size_x / 2
	for n in range(cards.size()):
		# Moving to center
		var final_card_position = Vector2(card_placement_starting_point + ((card_size_x - overlap) * n ), center.y)
		print("Final Card position: " + str(final_card_position))
		move_card_to(cards[n], final_card_position, speed)
		# Upsizing
		var size_tween := create_tween()
		size_tween.tween_property(cards[n], "scale", Vector2(1.3, 1.3), speed).from_current()
		# Rotating to normal
		var rotation_tween := create_tween()
		rotation_tween.tween_property(cards[n], "rotation", deg_to_rad(0), speed).from_current()
	# Waiting a bit
	await get_tree().create_timer(0.5).timeout
	for n in range(cards.size()):
		# Moving to player
		move_card_to(cards[n], player_position, speed)
		# Sizing to zero
		var size_tween = create_tween()
		size_tween.tween_property(cards[n], "scale", Vector2(0, 0), speed).from_current()


func move_cards_to_player(cards: Array[Node], player: Control):
	await _move_cards_to_player(cards, player.get_player_position(), 0.25)
