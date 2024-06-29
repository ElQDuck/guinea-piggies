extends Panel

@export var card_view_port: SubViewportContainer
@export var back_texture: CompressedTexture2D
@export var front_texture: CompressedTexture2D
@export var displayed_card_image: TextureRect
@export var explosion_shader: GPUParticles2D

# Called when the node enters the scene tree for the first time.
func _ready():
	displayed_card_image.set_texture(back_texture)
	var shader: ShaderMaterial = explosion_shader.get_process_material()
	shader.set("shader_parameter/sprite", front_texture)
	explosion_shader.set_process_material(shader)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func flip_card(flip_duration: float):
	var half_flip_dur = flip_duration / 2
	var card_rotation_tween_90 = create_tween()
	await card_rotation_tween_90.tween_property(card_view_port.material, "shader_parameter/y_rot", -90.0, half_flip_dur).finished
	displayed_card_image.set_texture(front_texture)
	var card_rotation_tween_180 = create_tween()
	await card_rotation_tween_180.tween_property(card_view_port.material, "shader_parameter/y_rot", -180.0, half_flip_dur).from_current().finished


func flip_instant():
	displayed_card_image.set_texture(front_texture)


func destroy_card():
	# Scale down to have an expolosion from inside effect
	var scale_tween = create_tween()
	await scale_tween.tween_property(self, "scale", Vector2(0, 0), 0.25).from_current().finished
	explosion_shader.set_emitting(true)
	await explosion_shader.finished
	card_view_port.set_visible(false)


func get_card_size() -> Vector2:
	return card_view_port.get_size() / 2
