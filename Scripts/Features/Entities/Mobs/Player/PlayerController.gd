extends CharacterBody2D
class_name PlayerController

@export var config : PlayerConfig
@export var view: PlayerView

var movement := PlayerMovement.new()
var health := PlayerHealth.new()
var attack := PlayerAttack.new()

func init() -> void:
	movement.init(config, view);
	health.init(config, view)
	attack.init(config, view)
	health.on_died.connect(self.death_tween)
	respawn_tween()
	pass

func _process(delta: float) -> void:
	attack.process(delta)
	pass

func _physics_process(delta: float) -> void:
	movement.physics_process(delta)
	pass

func _input(event: InputEvent) -> void:
	handle_debug_keys(event)

func handle_debug_keys(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		if event.get_keycode() == KEY_H:
			health.take_damage(1)
		if event.get_keycode() == KEY_G:
			health.take_heal(1)
		if event.get_keycode() == KEY_R:
			get_tree().reload_current_scene()

func death_tween():
	var tween = self.create_tween()
	tween.tween_property(self, "scale", Vector2.ZERO, config.death_tween_duration)

func respawn_tween():
	self.scale = Vector2.ZERO
	var tween = self.create_tween()
	tween.stop(); 
	tween.play()
	tween.tween_property(self, "scale", Vector2.ONE, config.respawn_tween_duration) 
