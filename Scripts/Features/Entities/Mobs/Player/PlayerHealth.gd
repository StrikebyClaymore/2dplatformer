class_name PlayerHealth

var config : PlayerConfig
var view : PlayerView
var health : int
signal on_damage_taken(health: int)
signal on_heal_taken(health: int)
signal on_died()

func init(_config: PlayerConfig, _view: PlayerView) -> void:
	self.config = _config
	self.view = _view
	health = config.max_health
	view.hit_area.init(config.group)
	view.hit_area.received_hit.connect(self.on_hit_received)
	pass

func take_damage(damage: int) -> void:
	health = max(health - damage, 0)
	emit_signal("on_damage_taken", health)
	take_damage_tween()
	if health == 0:
		die()

func take_heal(heal: int) -> void:
	health = min(health + heal, config.max_health)
	emit_signal("on_heal_taken", health)

func die() -> void:
	emit_signal("on_died")

func on_hit_received(damage: int) -> void:
	take_damage(damage)
	pass

func take_damage_tween() -> void:
	var tween = view.create_tween()
	var original_color = view.body_polygon.modulate
	tween.tween_property(view.body_polygon, "modulate", config.take_damage_color, config.take_damage_tween_duration)
	await tween.finished
	var return_tween = view.create_tween()
	return_tween.tween_property(view.body_polygon, "modulate", original_color, config.take_damage_tween_duration)
