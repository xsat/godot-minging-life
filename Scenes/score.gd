extends Label

class_name Score

const SCORE_VALUE_SAVE_PATH: String = "user://score_value.save"

var value: int = 0

func plus_value(added_value: int) -> void:
	value += added_value
	_save_value()
	_update_score()
	
func _ready():
	_load_value()
	_update_score()
	
func _update_score() -> void:
	text = "%s" % value
	
func _save_value() -> void:
	var json_string: String = JSON.stringify(value)
	var score_value_file: FileAccess = FileAccess.open(SCORE_VALUE_SAVE_PATH, FileAccess.WRITE)
	score_value_file.store_line(json_string)
	score_value_file.close()
	
func _load_value() -> void:
	if FileAccess.file_exists(SCORE_VALUE_SAVE_PATH):
		var score_value_file: FileAccess = FileAccess.open(SCORE_VALUE_SAVE_PATH, FileAccess.READ)
		value = JSON.parse_string(score_value_file.get_line())
		score_value_file.close()
