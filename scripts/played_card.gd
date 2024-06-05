extends Panel

@export var card_view_port: SubViewportContainer
@export var back_texture: CompressedTexture2D
@export var front_texture: CompressedTexture2D
@export var displayed_card_image: TextureRect

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func flip_card(flip_duration: float):
	var card_rotation_tween = create_tween()
	card_rotation_tween.tween_property(card_view_port.material, "shader_parameter/y_rot", 180.0, flip_duration)
