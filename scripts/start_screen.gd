extends Control

@export var StartGameButton: Button

# Called when the node enters the scene tree for the first time.
func _ready():
	StartGameButton.pressed.connect(_on_start_game_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
