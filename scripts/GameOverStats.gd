extends Label

@onready var Player1 = $"../../../Player1"
@onready var Player2 = $"../../../Player2"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Player1.TotalScore >= 77 and Player2.TotalScore < 77:
		self.text = "Game Over\nCongratulations Player 1 you won the game with " + str(Player1.TotalScore) + " points."
	elif Player2.TotalScore >= 77 and Player1.TotalScore < 77:
		self.text = "Game Over\nCongratulations Player 2 you won the game with " + str(Player2.TotalScore) + " points."
	else:
		self.text = "Game Over\nCongratulations Player 1 and Player 2 you both won the game with Player 1" + str(Player1.TotalScore) + " and Player 2" + str(Player2.TotalScore) + " points."
