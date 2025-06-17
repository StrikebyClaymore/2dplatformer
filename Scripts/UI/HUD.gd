extends Node
class_name HUD

@export var health_array : Array[TextureRect] = []
@export var health_full_texture : AtlasTexture
@export var health_empty_texture : AtlasTexture

func init(player: PlayerController) -> void:
	player.health.on_damage_taken.connect(self.on_update_health)
	player.health.on_heal_taken.connect(self.on_update_health)
	on_update_health(player.health.health)
	pass

func on_update_health(health: int):
	for i in health_array.size():
		if i < health:
			health_array[i].texture = health_full_texture
		else:
			health_array[i].texture = health_empty_texture
