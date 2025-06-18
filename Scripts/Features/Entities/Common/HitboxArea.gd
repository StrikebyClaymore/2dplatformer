extends DetectArea
class_name HitboxArea

signal received_hit(damage: int)

func apply_hit(damage: int) -> void:
	emit_signal("received_hit", damage)
	pass
