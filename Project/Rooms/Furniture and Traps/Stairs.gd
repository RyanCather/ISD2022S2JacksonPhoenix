extends Area2D

onready var collision_shape: CollisionShape2D = get_node("CollisionShape2D")

func _on_Stairs_body_entered(_body: KinematicBody2D) -> void:
	get_tree().change_scene("res://Game.tscn")