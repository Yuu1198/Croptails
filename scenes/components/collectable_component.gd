class_name CollectableComponent
extends Area2D

@export var collectable_name: String

func _on_body_entered(body):
	if body is Player:
		InventoryManager.add_collectable(collectable_name) #add collectable to inventory
		print("Collected: ", collectable_name)
		get_parent().queue_free()
