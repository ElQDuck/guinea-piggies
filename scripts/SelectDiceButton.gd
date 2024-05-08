extends Button

@onready var Dice1 = $"../HBoxContainer/1"
@onready var Dice2 = $"../HBoxContainer/2"
@onready var Dice3 = $"../HBoxContainer/3"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !Dice1.is_pressed() and !Dice2.is_pressed() and !Dice3.is_pressed():
		self.disabled = true
	else:
		self.disabled = false


func _on__toggled_1(toggled_on):
	if toggled_on:
		Dice2.set_pressed_no_signal(false)
		Dice3.set_pressed_no_signal(false)


func _on__toggled_2(toggled_on):
	if toggled_on:
		Dice1.set_pressed_no_signal(false)
		Dice3.set_pressed_no_signal(false)


func _on__toggled_3(toggled_on):
	if toggled_on:
		Dice1.set_pressed_no_signal(false)
		Dice2.set_pressed_no_signal(false)
		
