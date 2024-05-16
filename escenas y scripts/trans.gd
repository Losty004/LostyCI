extends CanvasLayer

@onready var anim = $AnimationPlayer

func _ready():
	layer = -1
	$AnimationPlayer.play("new_animation")
	
func change_scene(path : String) -> void:
	layer = 1
	anim.play("new_animation")
	await ($AnimationPlayer.animation_finished)
	get_tree().change_scene_to_file(path)
	anim.play_backwards("new_animation")
	await ($AnimationPlayer.animation_finished)
	layer = -1
