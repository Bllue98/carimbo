extends CharacterBody2D

#Sons aleatórios
@onready var sons = [
	$passo1,
	$passo2,
	$passo3,
	$passo4,
	$passo5,
	$passo6
]

var tempo_passo = 1.0
var intervalo = 0.4

func tocar_passo():
	var indice = randi_range(0, sons.size() - 1)
	sons[indice].play()
	

# Movimentação do personagem
const VELOCIDADE = 300.0

func _physics_process(delta: float):
	var direcao = Vector2.ZERO
	
	if Input.is_action_pressed("andar_direita"):
		direcao.x += 1
		
	if Input.is_action_pressed("andar_esquerda"):
		direcao.x -= 1
		
	if Input.is_action_pressed("andar_cima"):
		direcao.y -= 1
		
	if Input.is_action_pressed("andar_baixo"):
		direcao.y += 1
		
	velocity = direcao.normalized() * VELOCIDADE
	move_and_slide()
	
	
	# SONS DE PASSOS ALEATÓRIOS
	if velocity.length() > 0:
		tempo_passo -= delta
		if tempo_passo <= 0:
			tocar_passo()
			tempo_passo = intervalo
			
	else: tempo_passo = 0
	
