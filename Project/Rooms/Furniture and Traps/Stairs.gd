extends Area2D

onready var collision_shape: CollisionShape2D = get_node("CollisionShape2D")

func _on_Stairs_body_entered(_body: KinematicBody2D) -> void:
	SceneTransistor.start_transition_to("res://Game.tscn")

