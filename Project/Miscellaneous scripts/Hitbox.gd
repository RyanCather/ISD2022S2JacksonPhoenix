extends Area2D
class_name Hitbox

export(int) var damage: int = 1 # damage variable
var knockback_direction: Vector2 = Vector2.ZERO # Direction of impact variable
export(int) var knockback_force: int = 300 # Knockback force variable

var body_inside: bool = false

onready var collision_shape: CollisionShape2D = get_child(0) # collision shape to be added as a child node
onready var timer: Timer = Timer.new()

func _init() -> void:
	var __ = connect("body_entered", self, "_on_body_entered") # Connects the signal to the entered body
	__ = connect("body_exited", self, "_on_body_exited")

func _ready() -> void:
	assert(collision_shape != null) # Makes sure the hitbox has a collision shape
	timer.wait_time = 1
	add_child(timer)

func _on_body_entered(body: PhysicsBody2D) -> void:
	body_inside = true
	timer.start()
	while body_inside:
		_collide(body)
		yield(timer, "timeout")

func _on_body_exited(_body: KinematicBody2D) -> void:
	body_inside = false
	timer.stop()

func _collide(body: KinematicBody2D) -> void:
	# Checks if the body parameter is null 
	if body == null or not body.has_method("take_damage"):
		queue_free()
	else:
		body.take_damage(damage, knockback_direction, knockback_force)
