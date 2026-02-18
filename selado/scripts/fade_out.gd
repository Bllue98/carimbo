extends CanvasLayer

var scene_to_go = ''
	
func fade_into(scene):
	scene_to_go = scene
	$AnimationPlayer.play('Fade-out')
	
func mudar_cena():
	get_tree().change_scene_to_file(scene_to_go)
