extends Button

@onready var Player1 = $"../../../Player1"
@onready var Player2 = $"../../../Player2"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	Player1.TotalScore = 0
	Player1.Active = true
	Player2.TotalScore = 0
	Player2.Active = false
	$"../..".hide()
	$"../../../RoundEndUi".hide()
	$"../../../DiceSelectionUi".hide()
