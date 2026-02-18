extends Node3D

@export var carimbo_estojo_fechado: Sprite3D
@export var carimbo_estojo_aberto: Sprite3D
@onready var area = $estojo/Area3D

func _ready():
	# Inicialmente, mostra a porta fechada
	carimbo_estojo_fechado.visible = true
	carimbo_estojo_aberto.visible = false
	
	# Conectar sinais de entrada/saída da área
	area.body_entered.connect(_on_body_entered)
	area.body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body is CharacterBody3D: 
		print("Entrou:", body.name)
		carimbo_estojo_fechado.visible = false
		carimbo_estojo_aberto.visible = true

func _on_body_exited(body):
	if body is CharacterBody3D: 
		print("saiu:", body.name)
		carimbo_estojo_fechado.visible = true
		carimbo_estojo_aberto.visible = false
