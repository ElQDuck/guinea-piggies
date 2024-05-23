extends Control

@export var player_1: Control
@export var player_2: Control
# Called when the node enters the scene tree for the first time.
func _ready():
	player_1.ready_button.pressed.connect(_toggled_ready_button.bind("1"))
	player_2.ready_button.pressed.connect(_toggled_ready_button.bind("2"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _toggled_ready_button(player_name: String):
	if player_1.customisation_ready == true and player_2.customisation_ready == true:
		print("Both players are ready")
