extends CanvasLayer

@export var box_panel: Panel
@export var lofty_button_1: TextureButton
@export var lofty_button_2: TextureButton
@export var lofty_button_3: TextureButton
@export var start_wheel_button: Button
@export var fortune_wheel: Control
var selected_lofty: int = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	lofty_button_1.toggled.connect(_handle_lofty_selection.bind(1))
	lofty_button_2.toggled.connect(_handle_lofty_selection.bind(2))
	lofty_button_3.toggled.connect(_handle_lofty_selection.bind(3))
	start_wheel_button.pressed.connect(_handle_start_wheel_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _handle_lofty_selection(toggled_on: bool, selection: int):
	if toggled_on:
		selected_lofty = selection


func _handle_start_wheel_button_pressed():
	print(selected_lofty)
