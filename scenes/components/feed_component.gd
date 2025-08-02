class_name FeedComponent
extends Area2D

signal food_received(area: Area2D)

func _on_area_entered(area):
	food_received.emit(area)
