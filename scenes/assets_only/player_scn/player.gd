extends CharacterBody3D


var SPEED = 5.0
const JUMP_VELOCITY = 6

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var neck := $Node3D_Neck
@onready var camera := $Node3D_Neck/Camera3D
@onready var steps := $Steps

func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * 0.01)
			camera.rotate_x(-event.relative.y * 0.01)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-50), deg_to_rad(60))
	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		if is_on_floor():
			steps.play()
			
	if Input.is_action_pressed("sprint"):
		SPEED = 10.0
		
	if Input.is_action_just_released("sprint"):
		SPEED = 5.0
	
	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	if (Input.is_action_pressed("back") || Input.is_action_pressed("forward") || Input.is_action_pressed("left") || Input.is_action_pressed("right"))  && is_on_floor():
		if not steps.is_playing():
			steps.pitch_scale = randf_range(1,1.5)
			steps.play()
	

	move_and_slide()
