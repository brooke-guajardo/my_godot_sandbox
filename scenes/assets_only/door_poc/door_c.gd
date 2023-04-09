extends Node3D

@onready var looking := $/root/Node3D/Player/Node3D_Neck/Camera3D/IsPlayerLooking
@onready var anim_player := $MeshInstance3D/door_player
@onready var my_box := $MeshInstance3D/StaticBody3D
#@onready var sfx_player := $ramp_audio
var is_open = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if looking.is_colliding() && Input.is_action_just_released("interact_e") && looking.get_collider() == my_box:
		# toggle logic is cringe
		is_open = !is_open
		if is_open:
			print("opening door")
			anim_player.play("door_open")
			#sfx_player.play()
		else:
			print("closing door")
			anim_player.play("door_close")
			#sfx_player.play()
