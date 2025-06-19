class_name BaseEnemyAttack

const attack_anim_name : String = "attack"

var config : BaseEnemyConfig
var view : BaseEnemyView
var is_attacking : bool
var is_attack_cooldown: bool
var hit_targets : Array[Area2D] = []
signal attack_finished

func init(_config: BaseEnemyConfig, _view: BaseEnemyView) -> void:
	self.config = _config
	self.view = _view
	view.attack_area.init(config.group)
	view.attack_area.connect("area_entered", self.on_hit_area_entered)
	view.attack_animations.animation_finished.connect(self.on_animation_finished)
	pass

func process(delta: float) -> void:
	pass

func attack() -> void:
	if is_attacking or is_attack_cooldown:
		return
	is_attacking = true
	view.attack_animations.play(attack_anim_name)
	view.attack_area.enable()
	attack_cooldown_timer()

func on_animation_finished(anim_name: String) -> void:
	is_attacking = false
	is_attack_cooldown = true
	view.attack_area.disable()
	hit_targets.clear()
	emit_signal("attack_finished")
	attack_cooldown_timer()

func attack_cooldown_timer() -> void:
	await view.get_tree().create_timer(config.attack_cooldown_time).timeout
	is_attack_cooldown = false

func on_hit_area_entered(area: Area2D) -> void:
	if area is HitboxArea and area.group == EntityGroups.Groups.PLAYER:
		if area in hit_targets:
			return
		area.apply_hit(config.damage)
		hit_targets.append(area)
		pass
	pass
