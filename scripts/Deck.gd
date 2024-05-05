extends TextureButton

enum PiggyType { Predator = 0, Einstein = 1, Phoebe = 2, Ciri = 3, Legolas = 4, Triss = 5, Emma = 6, Tauriel = 7, Arya = 8, Teddy = 9, Nackedei = 10 }
var Cards = [
	Card.new(Card.PiggyType.Predator, 0), Card.new(Card.PiggyType.Predator, 0), Card.new(Card.PiggyType.Predator, 0), Card.new(Card.PiggyType.Predator, 0), Card.new(Card.PiggyType.Predator, 0), Card.new(Card.PiggyType.Predator, 0),
	Card.new(Card.PiggyType.Einstein, 1), Card.new(Card.PiggyType.Einstein, 1), Card.new(Card.PiggyType.Einstein, 2), Card.new(Card.PiggyType.Einstein, 2), Card.new(Card.PiggyType.Einstein, 3), Card.new(Card.PiggyType.Einstein, 4),
	Card.new(Card.PiggyType.Phoebe, 1), Card.new(Card.PiggyType.Phoebe, 1), Card.new(Card.PiggyType.Phoebe, 2), Card.new(Card.PiggyType.Phoebe, 2), Card.new(Card.PiggyType.Phoebe, 3), Card.new(Card.PiggyType.Phoebe, 4),
	Card.new(Card.PiggyType.Ciri, 1), Card.new(Card.PiggyType.Ciri, 1), Card.new(Card.PiggyType.Ciri, 2), Card.new(Card.PiggyType.Ciri, 2), Card.new(Card.PiggyType.Ciri, 3), Card.new(Card.PiggyType.Ciri, 4),
	Card.new(Card.PiggyType.Legolas, 1), Card.new(Card.PiggyType.Legolas, 1), Card.new(Card.PiggyType.Legolas, 2), Card.new(Card.PiggyType.Legolas, 2), Card.new(Card.PiggyType.Legolas, 3), Card.new(Card.PiggyType.Legolas, 4),
	Card.new(Card.PiggyType.Triss, 1), Card.new(Card.PiggyType.Triss, 1), Card.new(Card.PiggyType.Triss, 2), Card.new(Card.PiggyType.Triss, 2), Card.new(Card.PiggyType.Triss, 3), Card.new(Card.PiggyType.Triss, 4),
	Card.new(Card.PiggyType.Emma, 1), Card.new(Card.PiggyType.Emma, 1), Card.new(Card.PiggyType.Emma, 2), Card.new(Card.PiggyType.Emma, 2), Card.new(Card.PiggyType.Emma, 3), Card.new(Card.PiggyType.Emma, 4),
	Card.new(Card.PiggyType.Tauriel, 1), Card.new(Card.PiggyType.Tauriel, 1), Card.new(Card.PiggyType.Tauriel, 2), Card.new(Card.PiggyType.Tauriel, 2), Card.new(Card.PiggyType.Tauriel, 3), Card.new(Card.PiggyType.Tauriel, 4),
	Card.new(Card.PiggyType.Arya, 1), Card.new(Card.PiggyType.Arya, 1), Card.new(Card.PiggyType.Arya, 2), Card.new(Card.PiggyType.Arya, 2), Card.new(Card.PiggyType.Arya, 3), Card.new(Card.PiggyType.Arya, 4),
	Card.new(Card.PiggyType.Teddy, 1), Card.new(Card.PiggyType.Teddy, 1), Card.new(Card.PiggyType.Teddy, 2), Card.new(Card.PiggyType.Teddy, 2), Card.new(Card.PiggyType.Teddy, 3), Card.new(Card.PiggyType.Teddy, 4),
	Card.new(Card.PiggyType.Nackedei, 1), Card.new(Card.PiggyType.Nackedei, 1), Card.new(Card.PiggyType.Nackedei, 2), Card.new(Card.PiggyType.Nackedei, 2), Card.new(Card.PiggyType.Nackedei, 3), Card.new(Card.PiggyType.Nackedei, 4)
]
#var Cards = [
	#{type = PiggyType.Predator, value = 0}, {type = PiggyType.Predator, value = 0}, {type = PiggyType.Predator, value = 0}, {type = PiggyType.Predator, value = 0}, {type = PiggyType.Predator, value = 0}, {type = PiggyType.Predator, value = 0},
	#{type = PiggyType.Einstein, value = 1}, {type = PiggyType.Einstein, value = 1}, {type = PiggyType.Einstein, value = 2}, {type = PiggyType.Einstein, value = 2}, {type = PiggyType.Einstein, value = 3}, {type = PiggyType.Einstein, value = 4},
	#{type = PiggyType.Phoebe, value = 1}, {type = PiggyType.Phoebe, value = 1}, {type = PiggyType.Phoebe, value = 2}, {type = PiggyType.Phoebe, value = 2}, {type = PiggyType.Phoebe, value = 3}, {type = PiggyType.Phoebe, value = 4},
	#{type = PiggyType.Ciri, value = 1}, {type = PiggyType.Ciri, value = 1}, {type = PiggyType.Ciri, value = 2}, {type = PiggyType.Ciri, value = 2}, {type = PiggyType.Ciri, value = 3}, {type = PiggyType.Ciri, value = 4},
	#{type = PiggyType.Legolas, value = 1}, {type = PiggyType.Legolas, value = 1}, {type = PiggyType.Legolas, value = 2}, {type = PiggyType.Legolas, value = 2}, {type = PiggyType.Legolas, value = 3}, {type = PiggyType.Legolas, value = 4},
	#{type = PiggyType.Triss, value = 1}, {type = PiggyType.Triss, value = 1}, {type = PiggyType.Triss, value = 2}, {type = PiggyType.Triss, value = 2}, {type = PiggyType.Triss, value = 3}, {type = PiggyType.Triss, value = 4},
	#{type = PiggyType.Emma, value = 1}, {type = PiggyType.Emma, value = 1}, {type = PiggyType.Emma, value = 2}, {type = PiggyType.Emma, value = 2}, {type = PiggyType.Emma, value = 3}, {type = PiggyType.Emma, value = 4},
	#{type = PiggyType.Tauriel, value = 1}, {type = PiggyType.Tauriel, value = 1}, {type = PiggyType.Tauriel, value = 2}, {type = PiggyType.Tauriel, value = 2}, {type = PiggyType.Tauriel, value = 3}, {type = PiggyType.Tauriel, value = 4},
	#{type = PiggyType.Arya, value = 1}, {type = PiggyType.Arya, value = 1}, {type = PiggyType.Arya, value = 2}, {type = PiggyType.Arya, value = 2}, {type = PiggyType.Arya, value = 3}, {type = PiggyType.Arya, value = 4},
	#{type = PiggyType.Teddy, value = 1}, {type = PiggyType.Teddy, value = 1}, {type = PiggyType.Teddy, value = 2}, {type = PiggyType.Teddy, value = 2}, {type = PiggyType.Teddy, value = 3}, {type = PiggyType.Teddy, value = 4},
	#{type = PiggyType.Nackedei, value = 1}, {type = PiggyType.Nackedei, value = 1}, {type = PiggyType.Nackedei, value = 2}, {type = PiggyType.Nackedei, value = 2}, {type = PiggyType.Nackedei, value = 3}, {type = PiggyType.Nackedei, value = 4}
#]
signal card_drawn_from_deck(drawnCard)

# Called when the node enters the scene tree for the first time.
func _ready():
	add_user_signal("card_drawn_from_deck", [{"name": "drawnCard", "type": Card}])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pressed():
	var drawnCard: Card = DrawRandomCard()
	card_drawn_from_deck.emit(drawnCard)
	$"../../GridContainer".add_child(CreateCard(drawnCard.Type, drawnCard.Value))

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
	
func DrawRandomCard():
	if Cards.size() > 0:
		var cardFromDeck = Cards.pick_random()
		Cards.erase(cardFromDeck)
		print(cardFromDeck)
		print(Cards.size())
		return cardFromDeck
	return null
