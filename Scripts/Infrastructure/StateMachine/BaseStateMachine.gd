class_name BaseStateMachine

var _states : Dictionary = {}
var _current_state : BaseState = null
var _previous_state : BaseState = null

func enter(state_type: String) -> void:
	var state = set_state(state_type)
	if state:
		state.enter()

func process(delta: float) -> void:
	if _current_state:
		_current_state.process(delta)

func physics_process(delta: float) -> void:
	if _current_state:
		_current_state.physics_process(delta)

func add_state(state_name: String, state: BaseState) -> void:
	_states[state_name] = state

func set_state(state_type: String) -> BaseState:
	if _current_state:
		_current_state.exit()
	_previous_state = _current_state
	var state: BaseState = get_state(state_type)
	_current_state = state
	return state

func get_state(state_type: String) -> BaseState:
	return _states.get(state_type)
