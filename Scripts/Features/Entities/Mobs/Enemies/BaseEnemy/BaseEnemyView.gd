extends Node2D
class_name BaseEnemyView

@export var character : CharacterBody2D
@export var body_polygon : Polygon2D
@export var hit_area : HitboxArea
@export var floor_detector_left : RayCast2D
@export var floor_detector_right :  RayCast2D
@export var attack_area: AttackArea
@export var attack_animations: AnimationPlayer
@export var trail_particles: CPUParticles2D
@export var death_particles: CPUParticles2D
@export var enemy_detector_area: DetectArea
@export var fight_area: DetectArea
