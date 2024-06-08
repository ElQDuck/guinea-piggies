## The Card object
class_name Card
extends Object

## The possible Types of guinea pigs
enum PiggyType { Predator = 0, Einstein = 1, Phoebe = 2, Ciri = 3, Legolas = 4, Triss = 5, Emma = 6, Tauriel = 7, Arya = 8, Teddy = 9, Kruemel = 10 }

## The GuineaPig Type
var Type: int:
	get:
		return Type
	set(newType):
		Type = clampi(newType, 0, 10)

## The Card value.
## Possible values: 0 -> Predator; 1-4 Card Values
var Value: int:
	get:
		return Value
	set(newValue):
		Value = clampi(newValue, 0, 4)

var played_card_scene: PackedScene = load("res://scenes/played_card.tscn")

func _init(type: int, value: int):
	Type = clampi(type, 0, 10)
	Value = clampi(value, 0, 4)


func get_scene() -> Panel:
	var played_card: Panel = played_card_scene.instantiate()
	var texturePathPreset := "res://assets/cards/%s%s.png"
	var texturePath = texturePathPreset % [PiggyType.keys()[Type], Value]
	played_card.front_texture = load(texturePath)
	return played_card
