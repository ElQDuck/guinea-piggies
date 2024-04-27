extends TextureButton

enum PiggyType {
	Predator = 0,
	Einstein = 1,
	Phoebe = 2,
	Ciri = 3,
	Legolas = 4,
	Triss = 5,
	Emma = 6,
	Tauriel = 7,
	Arya = 8,
	Teddy = 9,
	Nackedei = 10
}

var Cards = [
	{type = PiggyType.Einstein, value = 1}
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	$"../../GridContainer".add_child(CreateCard(PiggyType.Phoebe, 2))

func CreateCard(piggyType: int, cardValue: int) -> Node:
	var marginContainer = MarginContainer.new()
	var textureRect = TextureRect.new()
	var texturePathPreset := "res://assets/%s%s.png"
	var texturePath = texturePathPreset % [PiggyType.keys()[piggyType], cardValue]
	
	if piggyType == 0 or cardValue == 0:
		texturePath = "res://assets/Predator.png"
	
	textureRect.texture = load(texturePath)
	textureRect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	marginContainer.add_child(textureRect)
	marginContainer.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	marginContainer.size_flags_vertical = Control.SIZE_EXPAND_FILL
	return marginContainer
	
