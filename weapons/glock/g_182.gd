extends Node3D
@export var AUDIO_PLAYER: AudioStreamPlayer3D
@export var ANIMATION_PLAYER: AnimationPlayer
@export var FIRE_SPEED: float = 24.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fire_weapon():
	ANIMATION_PLAYER.play("g18_firing", -1, FIRE_SPEED)
	AUDIO_PLAYER.play()
