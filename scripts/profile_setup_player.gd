extends Control

@export var color_preview: Panel
@export var color_button_left: Button
@export var color_button_right: Button
@export var avatar_image: TextureRect
@export var avatar_border: Panel
@export var avatar_button_left: Button
@export var avatar_button_right: Button
@export var input_player_name: LineEdit
@export var ready_button: Button

var selected_player_name: String = ""
var selected_image_index:int = 0
var selected_color_index: int = 0
var color_combinations: Array = [
	{"primary": Color("ff6b6b"),
	"secondary": Color("f7b7bb"),
	"font_color": Color("ffffff"),
	"complementary_primary": Color("2fadcc"),
	"complementary_secondary": Color("d0ecff"),
	"complementary_font_color": Color("000000")},
	
	{"primary": Color("f457cf"),
	"secondary": Color("fbbdea"),
	"font_color": Color("000000"),
	"complementary_primary": Color("83f67b"),
	"complementary_secondary": Color("cffcc9"),
	"complementary_font_color": Color("000000")},
	
	{"primary": Color("4ec4ff"),
	"secondary": Color("b4e5ff"),
	"font_color": Color("000000"),
	"complementary_primary": Color("ff894e"),
	"complementary_secondary": Color("ffcbb3"),
	"complementary_font_color": Color("000000")}
	]


# Called when the node enters the scene tree for the first time.
func _ready():
	# Connecting signals
	color_button_left.pressed.connect(_on_color_button_left_pressed)
	color_button_right.pressed.connect(_on_color_button_right_pressed)
	avatar_button_left.pressed.connect(_on_avatar_button_left_pressed)
	avatar_button_right.pressed.connect(_on_avatar_button_right_pressed)
	ready_button.toggled.connect(_on_ready_button_toggled)
	#get_tree().get_root().size_changed.connect(_reset_pivot)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_reset_pivot()


func _on_color_button_left_pressed():
	if selected_color_index == 0:
		selected_color_index = color_combinations.size() - 1
	else:
		selected_color_index -= 1
	_change_panel_bg_color(color_combinations[selected_color_index]["primary"])
	_change_avatar_border_color(color_combinations[selected_color_index]["primary"])


func _on_color_button_right_pressed():
	if selected_color_index == color_combinations.size() - 1:
		selected_color_index = 0
	else:
		selected_color_index += 1
	_change_panel_bg_color(color_combinations[selected_color_index]["primary"])
	_change_avatar_border_color(color_combinations[selected_color_index]["primary"])


func _change_avatar_border_color(color: Color):
	var avatarBorderStyleBox: StyleBoxFlat = avatar_border.get_theme_stylebox("panel").duplicate()
	avatarBorderStyleBox.set("border_color", color)
	avatar_border.add_theme_stylebox_override("panel", avatarBorderStyleBox)


func _change_panel_bg_color(color: Color):
	var colorPreviewStyleBox: StyleBoxFlat = color_preview.get_theme_stylebox("panel").duplicate()
	colorPreviewStyleBox.set("bg_color", color)
	color_preview.add_theme_stylebox_override("panel", colorPreviewStyleBox)


func _on_avatar_button_left_pressed():
	if selected_image_index == 0:
		selected_image_index = 8
	else:
		selected_image_index -= 1
	avatar_image.texture = load("res://assets/avatar_images/profile" + str(selected_image_index) + ".png")


func _on_avatar_button_right_pressed():
	if selected_image_index == 8:
		selected_image_index = 0
	else:
		selected_image_index += 1
	avatar_image.texture = load("res://assets/avatar_images/profile" + str(selected_image_index) + ".png")


func _on_ready_button_toggled(toggled_on: bool):
	# Disable all player input
	# TODO
	
	# Check if name entered otherwise assign a random one
	if toggled_on == true and input_player_name.text == "":
		selected_player_name = str(Card.PiggyType.find_key(randi() % 10 + 1))
	else:
		selected_player_name = input_player_name.text


# Adjust the pivot to make rotations around the center
func _reset_pivot():
	self.pivot_offset = self.get_size() / 2

