extends Node
class_name HUD

@export var health_bar : ProgressBar

func init(player: PlayerController) -> void:
	player.health.on_damage_taken.connect(self.on_update_health)
	player.health.on_heal_taken.connect(self.on_update_health)
	health_bar.max_value = player.config.max_health
	on_update_health(player.health.health)
	pass

func on_update_health(value: int):
	health_bar.value = value
	pass
