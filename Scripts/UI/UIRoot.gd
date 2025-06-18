extends CanvasLayer
class_name UIRoot

@export var hud : HUD
@export var lose_screen : LoseScreen

func init(level_manager: LevelManager, player: PlayerController) -> void:
	hud.init(level_manager, player)
	lose_screen.init(level_manager, player)
	pass
