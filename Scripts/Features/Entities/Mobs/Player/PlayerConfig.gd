extends Resource
class_name PlayerConfig

@export_category("Movement")
@export var move_speed : float = 400
@export var jump_force : float = 600
@export var max_jump_count : int = 1
@export var double_jump : = false
var gravity : float = ProjectSettings.get("physics/2d/default_gravity")

@export_category("Health")
@export var max_health : int = 3
@export var take_damage_color : Color = Color(1, 0, 0, 1)
@export var take_damage_tween_duration : float = 0.1

@export_category("Attack")
@export var damage : int = 1
@export var attack_cooldown_time : float = 0.1

@export_category("Base")
@export var group : EntityGroups.Groups = EntityGroups.Groups.PLAYER
@export var death_tween_duration : float = 0.15
@export var respawn_tween_duration : float = 0.15
