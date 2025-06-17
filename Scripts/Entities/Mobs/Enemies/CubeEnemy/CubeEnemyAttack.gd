extends Node
class_name CubeEnemyAttack

const attack_anim_name : String = "attack"

var config : CubeEnemyConfig
var view : CubeEnemyView
var is_attacking : bool
var is_attack_cooldown: bool

func init(_config: CubeEnemyConfig, _view: CubeEnemyView) -> void:
	self.config = _config
	self.view = _view
	view.attack_area.init(config.group, config.damage)
	view.attack_animations.animation_finished.connect(self.on_animation_finished)
	pass

func process(_delta: float) -> void:
	
	pass

func attack() -> void:
	if is_attacking or is_attack_cooldown:
		return
	is_attacking = true
	view.attack_animations.play(attack_anim_name)
	attack_cooldown_timer()

func on_animation_finished(anim_name: String) -> void:
	is_attacking = false
	is_attack_cooldown = true
	attack_cooldown_timer()

func attack_cooldown_timer() -> void:
	await view.get_tree().create_timer(config.attack_cooldown_time).timeout
	is_attack_cooldown = false
