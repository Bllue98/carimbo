extends Button


func _ready():
	pressed.connect(_on_button_pressed)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	

func _on_button_pressed():
	get_tree().quit()

	
#som de selecionar botão e aumentar ele de tamanho
func _on_mouse_entered():
	$hover_botao.play()
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.2,1.2), 0.1)
	
#tween para animação de troca de tamanhos (versao out)
func _on_mouse_exited():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.0,1.0), 0.1)
