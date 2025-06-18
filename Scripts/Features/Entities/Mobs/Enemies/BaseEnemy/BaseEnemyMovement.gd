class_name BaseEnemyMovement

var config : BaseEnemyConfig
var view : BaseEnemyView
var character : CharacterBody2D
var direction: int = 1

func init(_config: BaseEnemyConfig, _view: BaseEnemyView) -> void:
	self.config = _config
	self.view = _view
	character = view.character
	pass

func process(delta: float) -> void:
	pass

func physics_process(delta: float) -> void:
	movement()
	animations()
	pass

func movement() -> void:
	character.velocity = Vector2(direction * config.move_speed, character.velocity.y)
	character.move_and_slide()

func set_move_direction(_direction: int) -> void:
	if(_direction == 0 or _direction == self.direction):
		return
	direction = _direction
	self.direction = direction
	view.scale.x = direction
	view.body_polygon.scale.x = direction

func animations() -> void:
	view.trail_particles.emitting = false
	if character.is_on_floor():
		if abs(character.velocity.x) > 0:
			view.trail_particles.emitting = true
