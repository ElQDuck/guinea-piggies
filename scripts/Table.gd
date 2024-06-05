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
	var played_card: Panel = played_card_scene.instantiate()
	drawn_cards_area.add_child(played_card)
	played_card.flip_card(3)
