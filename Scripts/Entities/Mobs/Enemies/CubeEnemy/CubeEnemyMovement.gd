class_name CubeEnemyMovement

var config : CubeEnemyConfig
var view : CubeEnemyView
var character : CharacterBody2D
var direction: int = 1

func init(_config: CubeEnemyConfig, _view:CubeEnemyView) -> void:
	self.config = _config
	self.view = _view
	character = view.character
	pass

func process(_delta: float) -> void:
	movement()
	animations()
	pass

func movement() -> void:
	#character.velocity = Vector2(1 * config.move_speed, character.velocity.y)
	#flip(1)
	#character.move_and_slide()
	pass

func flip(_direction: int) -> void:
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
	pass
