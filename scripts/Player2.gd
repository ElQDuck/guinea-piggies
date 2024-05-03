extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_end_turn_pressed():
	print("Player1 ended turn")
	print("He got:")
	print($"../Table".Cards)
