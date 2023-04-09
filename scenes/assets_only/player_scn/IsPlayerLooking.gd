extends RayCast3D

@onready var fire := $/root/Node3D/campfire
@onready var tree := $/root/Node3D/trees

# Called when the node enters the scene tree for the first time.
func _ready():
	add_exception($/root/Node3D/MeshInstance3D/StaticBody3D)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_colliding():
		if get_collider() == fire:
			print("looks toasty")
		if get_collider() == tree:
			print("bark bark bark")
