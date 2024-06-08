extends Control

@export var deck: TextureButton
@export var drawn_cards_area: Control
@export var played_card_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	deck.card_drawn_from_deck.connect(_place_card_on_table)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _place_card_on_table(card: Card):
	print("_place_card_on_table called with card")
	print(card.Type)
	
	var deck_position: Vector2 = get_object_global_center_position(deck)
	var cards_area_center_position: Vector2 = drawn_cards_area.get_global_position()
	var newCard: Card = Card.new(Card.PiggyType.Einstein, 1)
	var played_card: Panel = newCard.get_scene()
	drawn_cards_area.add_child(played_card)
	move_card(played_card, deck_position, cards_area_center_position)
	played_card.flip_card(3)


func move_card(card_in_scene: Panel, from: Vector2, to: Vector2):
	var tween = create_tween()
	tween.tween_property(card_in_scene, "global_position", to, 3).from(from)


func get_object_global_center_position(object) -> Vector2:
	var object_global_position: Vector2 = object.get_global_position()
	var object_size: Vector2 = object.get_size()
	var object_center_global_position: Vector2 = object_global_position + object_size / 2
	return object_center_global_position
