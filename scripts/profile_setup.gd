extends Control

@export var player_1: Control
# Called when the node enters the scene tree for the first time.
func _ready():
	player_1.ReadyButton.pressed.connect(_toggled_ready_button.bind("blub"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _toggled_ready_button(player_name: String):
	print("Player " + player_name + " toggled ready button")
