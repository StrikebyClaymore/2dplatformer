extends Resource
class_name BaseEnemyConfig

@export_category("Movement")
@export var move_speed : float = 200

@export_category("Health")
@export var max_health : int = 1
@export var take_damage_color : Color = Color(1, 0, 0, 1)
@export var take_damage_tween_duration : float = 0.1

@export_category("Attack")
@export var damage : int = 1
@export var attack_cooldown_time : float = 0.5

@export_category("Base")
@export var group : EntityGroups.Groups = EntityGroups.Groups.ENEMY
@export var death_tween_duration : float = 0.15
@export var chase_stop_distance : float = 0.15
@export var exit_fight_delay : float = 0.4
