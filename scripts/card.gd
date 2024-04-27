class_name Card
extends MarginContainer

enum PiggyType {
	Einstein = 0,
	Phoebe = 1,
	Ciri = 2,
	Legolas = 3,
	Triss = 4,
	Emma = 5,
	Tauriel = 6,
	Arya = 7,
	Teddy = 8,
	Nackedei = 9,
	Predator = 10
}

@export_enum("Predator:0", "1:1", "2:2", "3:3", "4:4") var Value: int
@export_enum(
	"Einstein:0",
	"Phoebe:1",
	"Ciri:2",
	"Legolas:3",
	"Triss:4",
	"Emma:5",
	"Tauriel:6",
	"Arya:7",
	"Teddy:8",
	"Nackedei:9",
	"Predator:10"
	) var Type : int

# Called when the node enters the scene tree for the first time.
func _ready():
	var texturePathPreset := "res://assets/%s%s.png"
	var texturePath = texturePathPreset % [PiggyType.keys()[Type], Value]
	
	if Value == 0 or Type == 10:
		texturePath = "res://assets/Predator.png"
	
	$TextureRect.texture = load(texturePath)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
