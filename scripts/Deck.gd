extends TextureButton

enum PiggyType { Predator = 0, Einstein = 1, Phoebe = 2, Ciri = 3, Legolas = 4, Triss = 5, Emma = 6, Tauriel = 7, Arya = 8, Teddy = 9, Kruemel = 10 }
var AllCardsInGame: Array[Card] = [
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
	Card.new(Card.PiggyType.Kruemel, 1), Card.new(Card.PiggyType.Kruemel, 1), Card.new(Card.PiggyType.Kruemel, 2), Card.new(Card.PiggyType.Kruemel, 2), Card.new(Card.PiggyType.Kruemel, 3), Card.new(Card.PiggyType.Kruemel, 4)
]
var Cards: Array[Card] = AllCardsInGame.duplicate(true)
signal card_drawn_from_deck(drawnCard: Card)
signal no_cards_in_deck()

# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(_on_pressed)
	#add_user_signal("card_drawn_from_deck", [{"name": "drawnCard", "type": Card}])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pressed():
	if Cards.size() > 0:
		var drawnCard: Card = draw_random_card()
		card_drawn_from_deck.emit(drawnCard)
	if Cards.size() == 0:
		no_cards_in_deck.emit()
		## Count Points of each player
		#Player1.CalculateScoreForCurrentRun()
		#Player2.CalculateScoreForCurrentRun()
		## Reset drawn cards and clear table
		#Player1.CardsInHand.clear()
		#Player2.CardsInHand.clear()
		#Table.CleanupTable()
		## Fill up Deck
		#Cards = AllCardsInGame.duplicate(true)
		## The Player with the lowest score starts the round
		#if Player1.TotalScore == Player2.TotalScore:
			## If Score is equal: Random player starts
			#Player1.Active = (randi_range(0, 1) == 0)
			#Player2.Active = !Player1.Active
		#if Player1.TotalScore < Player2.TotalScore:
			#Player1.Active = true
			#Player2.Active = false
		#else:
			#Player1.Active = false
			#Player2.Active = true
#
		#if Player1.TotalScore >= 77 or Player2.TotalScore >= 77:
			## PopUp Game End window
			#$"../../../../../GameEndUi".set_visible(true)
		#else:
			## Popup round end window
			#$"../../../../../RoundEndUi".set_visible(true)


#func CreateCard(piggyType: int, cardValue: int) -> Node:
	#var marginContainer = MarginContainer.new()
	#var textureRect = TextureRect.new()
	#var texturePathPreset := "res://assets/cards/%s%s.png"
	#var texturePath = texturePathPreset % [PiggyType.keys()[piggyType], cardValue]
	#
	#if piggyType == 0 or cardValue == 0:
		#texturePath = "res://assets/cards/Predator.png"
	#
	#textureRect.texture = load(texturePath)
	#textureRect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	#marginContainer.add_child(textureRect)
	#marginContainer.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	#marginContainer.size_flags_vertical = Control.SIZE_EXPAND_FILL
	#return marginContainer
	
func draw_random_card():
	if Cards.size() > 0:
		var cardFromDeck: Card = Cards.pick_random()
		Cards.erase(cardFromDeck)
		return cardFromDeck
	return null
