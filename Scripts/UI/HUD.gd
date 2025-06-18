extends Control
class_name HUD

@export var score_label : Label
@export var health_bar : ProgressBar

func init(level_manager: LevelManager, player: PlayerController) -> void:
	player.health.on_damage_taken.connect(self.on_update_health)
	player.health.on_heal_taken.connect(self.on_update_health)
	health_bar.max_value = player.config.max_health
	level_manager.score_changed.connect(self.on_update_score)
	on_update_health(player.health.health)
	on_update_score(level_manager.score)
	pass

func on_update_health(value: int) -> void:
	health_bar.value = value
	pass

func on_update_score(value: int) -> void:
	score_label.text = str(value)
	pass
