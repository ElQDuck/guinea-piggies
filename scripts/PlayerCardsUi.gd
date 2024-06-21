extends CanvasLayer

@export var header_label: Label
@export var close_button: Button
var player_name: String = "TestPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	header_label.set_text(tr("LABEL_PLAYER_CARDS_IN_HAND") % player_name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func visible_on(player: Control) -> void:
	player_name = player.player_name
	self.set_visible(true)


func visible_off() -> void:
	self.set_visible(false)
