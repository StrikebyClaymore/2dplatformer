extends Area2D
class_name DetectArea

var group : EntityGroups.Groups

func init(_group: EntityGroups.Groups):
	self.group = _group
	pass

func enable():
	self.set_deferred("monitoring", true)
	self.set_deferred("monitorable", true)

func disable():
	self.set_deferred("monitoring", false)
	self.set_deferred("monitorable", false)
