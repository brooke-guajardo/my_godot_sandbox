extends Node3D

@onready var looking := $/root/Node3D/Player/Node3D_Neck/Camera3D/IsPlayerLooking
@onready var anim_player := $ramp_player
@onready var sfx_player := $ramp_audio
@onready var my_box := $ramp/StaticBody3D
var is_up = false
var is_animation = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if looking.is_colliding() && Input.is_action_just_released("interact_e") && looking.get_collider() == my_box:
		# toggle logic is cringe
		is_up = !is_up
		if is_up:
			print("Ramp go uppies")
			anim_player.play("ramp_up")
			sfx_player.play()
		else:
			print("Ramp going down")
			anim_player.play("ramp_down")
			sfx_player.play()
