extends Control
class_name LoseScreen

var level_manager : LevelManager

func init(_level_manager: LevelManager, player: PlayerController) -> void:
	self.level_manager = _level_manager
	player.health.on_died.connect(self.on_player_died)
	visible = false
	pass

func _on_restart_button_pressed() -> void:
	visible = false
	level_manager.restart_level()
	pass

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func on_player_died() -> void:
	visible = true
