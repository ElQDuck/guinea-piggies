extends Control

@export var color_preview: Panel
@export var color_button_left: Button
@export var color_button_right: Button
@export var avatar_image: TextureRect
@export var avatar_button_left: Button
@export var avatar_button_right: Button
@export var input_player_name: LineEdit
@export var ready_button: Button


# Called when the node enters the scene tree for the first time.
func _ready():
	color_button_left.pressed.connect(_on_color_button_left_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Adjust the pivot to make rotations around the center
	self.pivot_offset = self.get_size() / 2


func _on_color_button_left_pressed():
	print("left")
