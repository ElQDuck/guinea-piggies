extends CanvasLayer

@export var box_panel: Panel
@export var dice_select_panel: Panel
@export var lofty_button_1: TextureButton
@export var lofty_button_2: TextureButton
@export var lofty_button_3: TextureButton
@export var start_wheel_button: Button
@export var fortune_wheel: Control
var selected_lofty: int = 0
var oponent_cards_count: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	lofty_button_1.toggled.connect(_handle_lofty_selection.bind(1))
	lofty_button_2.toggled.connect(_handle_lofty_selection.bind(2))
	lofty_button_3.toggled.connect(_handle_lofty_selection.bind(3))
	start_wheel_button.pressed.connect(_handle_start_wheel_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match oponent_cards_count:
		1:
			lofty_button_2.set_visible(false)
			lofty_button_3.set_visible(false)
		2:
			lofty_button_2.set_visible(true)
			lofty_button_3.set_visible(false)
		_:
			lofty_button_2.set_visible(true)
			lofty_button_3.set_visible(true)
	
	if !lofty_button_1.is_pressed() and !lofty_button_2.is_pressed() and !lofty_button_3.is_pressed():
		start_wheel_button.set_disabled(true)
	else:
		start_wheel_button.set_disabled(false)


func _handle_lofty_selection(toggled_on: bool, selection: int):
	if toggled_on:
		selected_lofty = selection


func _handle_start_wheel_button_pressed():
	# Make the dice buttons invisible
	dice_select_panel.set_visible(false)
	
	# Resize to 0 to scale up with tween to get a pop up effect
	fortune_wheel.set_scale(Vector2(0, 0))
	fortune_wheel.set_visible(true)
	
	# Scaling up
	var scale_up_tween = create_tween()
	scale_up_tween.tween_property(fortune_wheel, "scale", Vector2(1, 1), 0.7).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	
	# Get random number for wheel result
	var random_num = randi() % 6 + 1
	
	# Spin the wheel
	fortune_wheel.spin(random_num)
	await get_tree().create_timer(5.5).timeout
	
	# Scaling down
	var scale_down_tween = create_tween()
	scale_down_tween.tween_property(fortune_wheel, "scale", Vector2(0, 0), 0.7).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_BACK)
	await scale_down_tween.finished
	
	# Reset this UI to the initial visibility
	dice_select_panel.set_visible(true)
	fortune_wheel.set_visible(false)
	self.set_visible(false)
	
	# Trigger a signal with the wheel result
	# TODO
