extends Node2D

@export var player_1: Control
@export var player_2: Control


# Called when the node enters the scene tree for the first time.
func _ready():
	player_1.colorColection = GlobalVars.player_1["color_combinations"]
	player_2.colorColection = GlobalVars.player_2["color_combinations"]
	
	player_1._update_ui()
	player_2._update_ui()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
