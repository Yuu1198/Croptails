extends Node

var inventory: Dictionary = Dictionary()

signal inventory_changed

func add_collectable(collectable_name: String) -> void:
	inventory.get_or_add(collectable_name) #add collectable name to inventory dictonary
	
	#if nothing in inventory that matches name
	if inventory[collectable_name] == null:
		inventory[collectable_name] = 1 #then instantiate item and add 1
	else:
		inventory[collectable_name] += 1 #inctement value
		
	inventory_changed.emit()

func remove_collectable(collectable_name: String) -> void:
	if inventory[collectable_name] == null:
		inventory[collectable_name] = 0 
	else:
		#remove item as long as we have items in the inventory
		if inventory[collectable_name] > 0:
			inventory[collectable_name] -= 1 
		
	inventory_changed.emit()
