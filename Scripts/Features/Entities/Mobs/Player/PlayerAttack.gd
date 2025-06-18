class_name PlayerAttack

const attack_anim_name : String = "attack"

var config : PlayerConfig
var view : PlayerView
var is_attacking : bool
var is_attack_cooldown: bool
var hit_targets : Array[Area2D] = []

func init(_config: PlayerConfig, _view: PlayerView) -> void:
	self.config = _config
	self.view = _view
	view.attack_area.init(config.group)
	view.attack_area.connect("area_entered", self.on_hit_area_entered)
	view.attack_animations.animation_finished.connect(self.on_animation_finished)
	pass

func process(delta: float) -> void:
	handle_attack()
	pass

func handle_attack() -> void:
	if Input.is_action_just_pressed("Attack"):
		attack()

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
	attack_cooldown_timer()

func attack_cooldown_timer() -> void:
	await view.get_tree().create_timer(config.attack_cooldown_time).timeout
	is_attack_cooldown = false

func on_hit_area_entered(area: Area2D) -> void:
	if area is HitboxArea and area.group == EntityGroups.Groups.ENEMY:
		if area in hit_targets:
			return
		area.apply_hit(config.damage)
		hit_targets.append(area)
		pass
	pass
