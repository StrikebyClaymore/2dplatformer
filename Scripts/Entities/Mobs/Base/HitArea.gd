extends Area2D
class_name HitArea

var group : EntityGroups.Groups

func init(_group: EntityGroups.Groups):
	self.group = _group
	enable()
	pass

func enable():
	self.monitoring = true
	self.monitorable = true

func disable():
	self.monitoring = false
	self.monitorable = false
