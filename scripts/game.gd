extends Node2D

@export var player_1: Control
@export var player_2: Control
@export var table: Control


# Called when the node enters the scene tree for the first time.
func _ready():
	player_1.end_turn.connect(_handle_player_end_turn.bind(player_1))
	player_1.profile_image_index = GlobalVars.player_1["selected_image_index"]
	player_1.player_name = GlobalVars.player_1["name"]
	player_1.colorColection = GlobalVars.player_1["color_combinations"]
	player_1.player_is_active = true
	
	player_2.end_turn.connect(_handle_player_end_turn.bind(player_2))
	player_2.profile_image_index = GlobalVars.player_2["selected_image_index"]
	player_2.player_name = GlobalVars.player_2["name"]
	player_2.colorColection = GlobalVars.player_2["color_combinations"]
	player_2.player_is_active = false
	
	player_1._update_ui()
	player_2._update_ui()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _handle_player_end_turn(player: Control):
	print(player.name + " ended turn.")
	_switch_active_player()
		


func _switch_active_player():
	if player_1.player_is_active:
		player_1.player_is_active = false
		player_2.player_is_active = true
	else:
		player_1.player_is_active = true
		player_2.player_is_active = false

