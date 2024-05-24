extends Control

var player_name: String
var profile_image: Texture2D
var cards_in_hand: Array[Card]
var score: int
var colorColection: Dictionary = {
	"primary": Color("ff6b6b"),
	"secondary": Color("f7b7bb"),
	"font_color": Color("ffffff"),
	"complementary_primary": Color("2fadcc"),
	"complementary_secondary": Color("d0ecff"),
	"complementary_font_color": Color("000000")
}
@export var scoreValueLabel: Label
@export var CardsCountValueLabel: Label
@export var button_end_turn: Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Adjust the pivot to make rotations around the center
	self.pivot_offset = self.get_size() / 2


func _update_ui():
	var uiPanel = $Panel
	var uiProfileImage = $Panel/TextureButton/ProfileImage
	var uiProfileImageBorder = $Panel/TextureButton/Panel
	var uiNameLabelBackground = $Panel/TextureButton/Name
	var uiPlayerNameLabel = $Panel/TextureButton/Name/Label
	var uiEndTurnButton = $Panel/Button
	
	# ProfileImage
	uiProfileImage.texture = profile_image
	
	# ProfileName
	uiPlayerNameLabel.text = player_name
	
	# ProfileColors
	var profileBorderStyleBox: StyleBoxFlat = uiProfileImageBorder.get_theme_stylebox("panel").duplicate()
	profileBorderStyleBox.set("border_color", colorColection["secondary"])
	uiProfileImageBorder.add_theme_stylebox_override("panel", profileBorderStyleBox)
	var profileLabelBackgroundStyleBox: StyleBoxFlat = uiNameLabelBackground.get_theme_stylebox("panel").duplicate()
	profileLabelBackgroundStyleBox.set("bg_color", colorColection["secondary"])
	uiNameLabelBackground.add_theme_stylebox_override("panel", profileLabelBackgroundStyleBox)
	var uiPanelStyleBox: StyleBoxFlat = uiPanel.get_theme_stylebox("panel").duplicate()
	uiPanelStyleBox.set("bg_color", colorColection["primary"])
	uiPanelStyleBox.set("border_color", colorColection["secondary"])
	uiPanel.add_theme_stylebox_override("panel", uiPanelStyleBox)
	
