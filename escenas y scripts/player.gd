extends CharacterBody2D
class_name Player
@export var SPEED = 500
@export var JUMP_VELOCITY = -500

@onready var anim = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var frutaslabel := $PlayerGUI/HBoxContainer/FrutasLabel
func _ready():
	Global.player = self
	
var atacar:bool = false




# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		
		velocity.y = JUMP_VELOCITY
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	var atack = Input.is_action_just_pressed("ataque")
	
	velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction != 0:
	
			anim.play("walk")
			velocity.x = direction * SPEED
	else:
			anim.play("idle")
	if !atack:
		atacar = true
		
	else:
		anim.play("ataque1")
		await (anim.animation_finished)
		atacar = false
		
	sprite.flip_h = direction < 0 if direction != 0 else sprite.flip_h
	
	if not is_on_floor():
		
		anim.play("jump")
	
	
	move_and_slide()

func actualizaInterfazFrutas():
	frutaslabel.text = str(Global.frutas)


