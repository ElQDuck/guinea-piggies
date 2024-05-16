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
	$Panel/TextureButton/ProfileImage.texture = profile_image
	
	var profileBorderStyleBox: StyleBoxFlat = $Panel/TextureButton/Panel.get_theme_stylebox("panel").duplicate()
	profileBorderStyleBox.set("border_color", primary_color)
	$Panel/TextureButton/Panel.add_theme_stylebox_override("panel", profileBorderStyleBox)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
