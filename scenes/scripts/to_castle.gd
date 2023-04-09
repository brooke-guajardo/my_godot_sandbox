extends Area3D

@onready var plyer := $/root/Node3D/Player
@onready var my_shape := $CollisionShape3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if overlaps_body(plyer):
		#print("you entered the door")
		get_tree().change_scene_to_file("res://scenes/maps/castle/castle.tscn")
