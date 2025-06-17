extends Area2D
class_name AttackArea

var group : EntityGroups.Groups
var damage : int

func init(_group: EntityGroups.Groups, _damage: int):
	self.group = _group
	self.damage = _damage
	pass

func enable():
	self.monitoring = true
	self.monitorable = true

func disable():
	self.monitoring = false
	self.monitorable = false
