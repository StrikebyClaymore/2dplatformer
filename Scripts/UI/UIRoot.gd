extends CanvasLayer
class_name UIRoot

@export var hud : HUD

func init(player: PlayerController) -> void:
	hud.init(player)
	pass
