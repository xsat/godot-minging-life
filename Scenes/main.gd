extends Node

class_name Main

@onready var miner: Miner = $Miner as Miner
@onready var score: Score = $Score as Score

var random: RandomNumberGenerator = RandomNumberGenerator.new()

func _ready() -> void:
	miner.timer.timeout.connect(_on_mining_done)
	
func _on_buy_pressed() -> void:
	score.plus_value(999)
	
func _on_mining_done() -> void:
	score.plus_value(_get_random_plus_value())
	
func _get_random_plus_value() -> int:
	random.randomize()
	
	var last_random_value: int = random.randi_range(0, 1000)
	
	if last_random_value <= 800:
		return 1
	elif last_random_value <= 950:
		return 3
	elif last_random_value <= 999:
		return 10
		
	return 1000
