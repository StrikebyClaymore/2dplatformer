extends CanvasLayer

enum state { FADE, SCALE }

const scenes_path: String = "Scenes/Levels/"
const scenes_ext: String = ".tscn"

@export var dissolve_rect : ColorRect
@export var scene_transition_anim : AnimationPlayer
@export var transition_type : state


func _ready() -> void:
	print(dissolve_rect)
	dissolve_rect.hide()

func load_scene_from_path(scene_path: String):
	var scene = load(scenes_path + scene_path + scenes_ext) as PackedScene
	load_scene(scene)
	pass

func load_scene(target_scene: PackedScene):
	match transition_type:
		state.FADE:
			transition_animation("fade", target_scene)
		state.SCALE:
			transition_animation("scale", target_scene)

func transition_animation(animation_name: String, scene: PackedScene):
	scene_transition_anim.play(animation_name)
	await scene_transition_anim.animation_finished
	get_tree().change_scene_to_packed(scene)
	scene_transition_anim.play_backwards(animation_name)
