extends Sprite2D

class_name Pickaxe

@onready var animation: AnimationPlayer = $Animation as AnimationPlayer

func start_mining() -> void:
	animation.play("mining")
	
func stop_minin() -> void:
	animation.stop()
	
	
