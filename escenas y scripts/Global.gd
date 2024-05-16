extends Node
@onready var uwu = $AudioStreamPlayer


var frutas := 0 : 
	set(val):
		frutas = val
		if player != null:
			player.actualizaInterfazFrutas()
			
	get:
		return frutas

var player
