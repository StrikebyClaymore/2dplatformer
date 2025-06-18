extends Area2D
class_name DetectArea

var group : EntityGroups.Groups

func init(_group: EntityGroups.Groups) -> void:
	self.group = _group
	pass

func enable() -> void:
	self.set_deferred("monitoring", true)
	self.set_deferred("monitorable", true)

func disable() -> void:
	self.set_deferred("monitoring", false)
	self.set_deferred("monitorable", false)
