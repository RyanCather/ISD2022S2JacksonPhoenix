extends Node
var player_master = null

func instance_node_at_location(node: Object, parent: Object, location: Vector2) -> Object:
	var node_instance = instance_node(node, parent)
	node_instance.global_position = location 
	return node_instance

func instance_node(node: Object, parent: Object) -> Object:
	var node_instance = node.instance()
	parent.add_child(node_instance)
	return node_instance

var audio_clips = {
	"Mouse_Click": preload("res://Audio/Mouse Click.wav"),
	"Enemy_Death": preload("res://Audio/Enemy Death.wav")
}
