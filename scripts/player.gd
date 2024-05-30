extends Control

var player_name: String
var profile_image_index: int
var cards_in_hand: Array[Card]
var player_is_active: bool = true
var score: int
var colorColection: Dictionary = {
	"primary": Color("ff6b6b"),
	"secondary": Color("f7b7bb"),
	"font_color": Color("ffffff"),
	"complementary_primary": Color("2fadcc"),
	"complementary_secondary": Color("d0ecff"),
	"complementary_font_color": Color("ffffff")
}
@export var scoreValueLabel: Label
@export var CardsCountValueLabel: Label
@export var button_end_turn: Button
@export var disable_layer_panel: Panel
@export var disable_layer_avater: Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Adjust the pivot to make rotations around the center
	self.pivot_offset = self.get_size() / 2
	
	if player_is_active:
		disable_layer_panel.set_visible(false)
		disable_layer_avater.set_visible(false)
	else:
		disable_layer_panel.set_visible(true)
		disable_layer_avater.set_visible(true)


func _update_ui():
	var uiPanel = $Panel
	var uiProfileImage = $Panel/TextureButton/ProfileImage
	var uiProfileImageBorder = $Panel/TextureButton/Panel
	var uiNameLabelBackground = $Panel/TextureButton/Name
	var uiPlayerNameLabel = $Panel/TextureButton/Name/Label
	
	# ProfileImage
	uiProfileImage.texture = load("res://assets/avatar_images/profile" + str(profile_image_index) + ".png")
	
	# ProfileName
	uiPlayerNameLabel.text = player_name
	
	# ProfileColors
	var profileBorderStyleBox: StyleBoxFlat = uiProfileImageBorder.get_theme_stylebox("panel").duplicate()
	profileBorderStyleBox.set("border_color", colorColection["primary"])
	uiProfileImageBorder.add_theme_stylebox_override("panel", profileBorderStyleBox)
	var profileLabelBackgroundStyleBox: StyleBoxFlat = uiNameLabelBackground.get_theme_stylebox("panel").duplicate()
	profileLabelBackgroundStyleBox.set("bg_color", colorColection["primary"])
	uiNameLabelBackground.add_theme_stylebox_override("panel", profileLabelBackgroundStyleBox)
	var uiPanelStyleBox: StyleBoxFlat = uiPanel.get_theme_stylebox("panel").duplicate()
	uiPanelStyleBox.set("bg_color", colorColection["secondary"])
	uiPanelStyleBox.set("border_color", colorColection["primary"])
	uiPanel.add_theme_stylebox_override("panel", uiPanelStyleBox)
	
	# Button Color
	# Normal
	button_end_turn.set("theme_override_colors/font_color", colorColection["complementary_font_color"])
	button_end_turn.set("theme_override_colors/font_pressed_color", colorColection["complementary_font_color"])
	button_end_turn.set("theme_override_colors/font_focus_color", colorColection["complementary_font_color"])
	var buttonStyleBoxNormal: StyleBoxFlat = button_end_turn.get_theme_stylebox("normal").duplicate()
	buttonStyleBoxNormal.set("bg_color", colorColection["complementary_secondary"])
	buttonStyleBoxNormal.set("border_color", colorColection["complementary_primary"])
	button_end_turn.add_theme_stylebox_override("normal", buttonStyleBoxNormal)
	# Hover
	button_end_turn.set("theme_override_colors/font_hover_color", colorColection["complementary_font_color"])
	var buttonStyleBoxHover: StyleBoxFlat = button_end_turn.get_theme_stylebox("hover").duplicate()
	buttonStyleBoxHover.set("bg_color", colorColection["complementary_secondary"])
	buttonStyleBoxHover.set("border_color", colorColection["complementary_primary"])
	button_end_turn.add_theme_stylebox_override("hover", buttonStyleBoxHover)
	# Pressed
	button_end_turn.set("theme_override_colors/font_pressed_color", colorColection["complementary_font_color"])
	var buttonStyleBoxPressed: StyleBoxFlat = button_end_turn.get_theme_stylebox("pressed").duplicate()
	buttonStyleBoxPressed.set("bg_color", colorColection["complementary_secondary"])
	buttonStyleBoxPressed.set("border_color", colorColection["complementary_primary"])
	button_end_turn.add_theme_stylebox_override("pressed", buttonStyleBoxPressed)
