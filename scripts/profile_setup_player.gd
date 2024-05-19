extends Control

@export var color_preview: Panel
@export var color_button_left: Button
@export var color_button_right: Button
@export var avatar_image: TextureRect
@export var avatar_button_left: Button
@export var avatar_button_right: Button
@export var input_player_name: LineEdit
@export var ready_button: Button

var color_combinations: Array = [
	{"primary": Color("ff6b6b"),
	"secondary": Color("f7b7bb"),
	"font_color": Color("000000"),
	"complementary_primary": Color("2fadcc"),
	"complementary_secondary": Color("d0ecff"),
	"complementary_font_color": Color("ffffff")}
	]

# Called when the node enters the scene tree for the first time.
func _ready():
	color_button_left.pressed.connect(_on_color_button_left_pressed)
	color_button_right.pressed.connect(_on_color_button_right_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Adjust the pivot to make rotations around the center
	self.pivot_offset = self.get_size() / 2


func _on_color_button_left_pressed():
	print("left")
	var colorPreviewStyleBox: StyleBoxFlat = color_preview.get_theme_stylebox("panel").duplicate()
	colorPreviewStyleBox.set("bg_color", color_combinations[0]["primary"])
	color_preview.add_theme_stylebox_override("panel", colorPreviewStyleBox)


func _on_color_button_right_pressed():
	print("right")

