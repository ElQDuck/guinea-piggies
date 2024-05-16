extends Control

@export var player_name: String
@export var profile_image: Texture2D
@export var cards_in_hand: Array[String]
var score: int
@export_color_no_alpha var primary_color: Color
@export_color_no_alpha var secondary_color: Color
@export_color_no_alpha var complementary_color: Color

# Called when the node enters the scene tree for the first time.
func _ready():
	var uiPanel = $Panel
	var uiProfileImage = $Panel/TextureButton/ProfileImage
	var uiProfileImageBorder = $Panel/TextureButton/Panel
	var uiNameLabelBackground = $Panel/TextureButton/Name
	var uiPlayerNameLabel = $Panel/TextureButton/Name/Label
	var uiEndTurnButton = $Panel/Button
	
	# ProfileImage
	uiProfileImage.texture = profile_image
	
	# ProfileName
	
	# ProfileColors
	var profileBorderStyleBox: StyleBoxFlat = uiProfileImageBorder.get_theme_stylebox("panel").duplicate()
	profileBorderStyleBox.set("border_color", secondary_color)
	uiProfileImageBorder.add_theme_stylebox_override("panel", profileBorderStyleBox)
	var profileLabelBackgroundStyleBox: StyleBoxFlat = uiNameLabelBackground.get_theme_stylebox("panel").duplicate()
	profileLabelBackgroundStyleBox.set("bg_color", secondary_color)
	uiNameLabelBackground.add_theme_stylebox_override("panel", profileLabelBackgroundStyleBox)
	var uiPanelStyleBox: StyleBoxFlat = uiPanel.get_theme_stylebox("panel").duplicate()
	uiPanelStyleBox.set("bg_color", primary_color)
	uiPanelStyleBox.set("border_color", secondary_color)
	uiPanel.add_theme_stylebox_override("panel", uiPanelStyleBox)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
