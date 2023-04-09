extends SpotLight3D

# Called when the node enters the scene tree for the first time.
@onready var fsfx := $Flash_Light_SFX

func _ready():
	spot_range = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("flash_light") && spot_range == 0:
		fsfx.play()
		spot_range = 15
	elif  Input.is_action_just_released("flash_light") && spot_range == 15:
		fsfx.play()
		spot_range = 0
	else:
		pass
