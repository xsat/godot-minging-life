extends Node2D

class_name Miner

@onready var pickaxe: Pickaxe = $Pickaxe as Pickaxe
@onready var timer: Timer = $Timer as Timer

func _on_start_pressed() -> void:
	pickaxe.start_mining()
	timer.start()

func _on_stop_pressed() -> void:
	pickaxe.stop_minin()
	timer.stop()
