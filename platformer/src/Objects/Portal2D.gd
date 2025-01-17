@tool
extends Area2D

@onready var anim_player: AnimationPlayer = $AnimationPlayer

@export var next_scene: PackedScene

func _on_body_entered(body: PhysicsBody2D) -> void:
	teleport()

func _get_configuration_warnings() -> String:
	return "The next scene property cannot be empty" if next_scene else ""

func teleport() -> void:
	anim_player.play("fade_in")
	
	await anim_player.animation_finished
	
	get_tree().change_scene_to_packed(next_scene)
