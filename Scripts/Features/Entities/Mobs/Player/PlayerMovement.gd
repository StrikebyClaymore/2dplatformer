class_name PlayerMovement

var config : PlayerConfig
var view : PlayerView
var character : CharacterBody2D
var jump_count : int = 0
var is_grounded : bool = false
var direction: int = 1

func init(_config: PlayerConfig, _view: PlayerView) -> void:
	self.config = _config
	self.view = _view
	character = view.character
	pass

func process(delta: float) -> void:
	pass

func physics_process(delta: float) -> void:
	movement(delta)
	animations()
	pass

func movement(delta: float) -> void:
	if !character.is_on_floor():
		character.velocity.y += config.gravity * delta
	elif character.is_on_floor():
		jump_count = config.max_jump_count
	handle_jumping()
	var inputAxis = Input.get_axis("Left", "Right")
	character.velocity = Vector2(inputAxis * config.move_speed, character.velocity.y)
	flip(inputAxis)
	character.move_and_slide()

func handle_jumping() -> void:
	if Input.is_action_just_pressed("Jump"):
		if character.is_on_floor() and !config.double_jump:
			jump()
		elif config.double_jump and jump_count > 0:
			jump()
			jump_count -= 1

func jump() -> void:
	jump_tween()
	character.velocity.y = -config.jump_force

func jump_tween() -> void:
	var tween = character.create_tween()
	tween.tween_property(character, "scale", Vector2(0.7, 1.4), 0.1)
	tween.tween_property(character, "scale", Vector2.ONE, 0.1)

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
