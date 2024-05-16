extends Control


func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://escenas y scripts/mundo.tscn")
	

	


func _on_salir_pressed():
	get_tree().quit()
	pass # Replace with function body.
