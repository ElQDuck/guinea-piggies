extends Node2D

@export var player_1: Control
@export var player_2: Control
@export var table: Control
@export var player_cards_ui: CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	player_1.end_turn.connect(_handle_player_end_turn_button.bind(player_1))
	player_1.profile_image_index = GlobalVars.player_1["selected_image_index"]
	player_1.player_name = GlobalVars.player_1["name"]
	player_1.colorColection = GlobalVars.player_1["color_combinations"]
	player_1.player_is_active = true
	
	player_2.end_turn.connect(_handle_player_end_turn_button.bind(player_2))
	player_2.profile_image_index = GlobalVars.player_2["selected_image_index"]
	player_2.player_name = GlobalVars.player_2["name"]
	player_2.colorColection = GlobalVars.player_2["color_combinations"]
	player_2.player_is_active = false
	
	player_1._update_ui()
	player_2._update_ui()
	
	table.add_cards_to_active_player.connect(_handle_add_cards_to_active_player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _handle_player_end_turn_button(player: Control):
	print(player.name + " ended turn.")
	if table.drawn_cards_area.get_children().size() > 0:
		var old_cards_in_hand_count = player.cards_in_hand.size()
		player.cards_in_hand.append_array(table.cards_on_table)
		await table.move_cards_to_player(table.drawn_cards_area.get_children(), player)
		player.change_cards_count_label_value(old_cards_in_hand_count, player.cards_in_hand.size())
		table.clean_up_table()
	_switch_active_player()


func _handle_add_cards_to_active_player(cards: Array[Card]):
	var active_player: Control = _get_active_player()
	var old_cards_in_hand_count = active_player.cards_in_hand.size()
	active_player.cards_in_hand.append_array(cards)
	await table.move_cards_to_player(table.drawn_cards_area.get_children(), active_player)
	active_player.change_cards_count_label_value(old_cards_in_hand_count, active_player.cards_in_hand.size())
	table.clean_up_table()
	_switch_active_player()


func _switch_active_player():
	if player_1.player_is_active:
		player_1.player_is_active = false
		player_2.player_is_active = true
	else:
		player_1.player_is_active = true
		player_2.player_is_active = false

func _get_active_player() -> Control:
	if player_1.player_is_active:
		return player_1
	return player_2
