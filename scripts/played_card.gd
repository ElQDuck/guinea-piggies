extends Panel

@export var card_view_port: SubViewportContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	flip_card()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func flip_card():
	var card_rotation_tween = create_tween()
	card_rotation_tween.tween_property(card_view_port.material, "shader_parameter/y_rot", 180.0, 5)
