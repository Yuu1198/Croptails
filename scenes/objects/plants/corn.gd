extends Node2D

var corn_harvest_scene = preload("res://scenes/objects/plants/corn_harvest.tscn")

@onready var sprite_2d = $Sprite2D
@onready var watering_particles = $WateringParticles
@onready var flowering_particles = $FloweringParticles
@onready var grow_cycle_component = $GrowCycleComponent
@onready var hurt_component = $HurtComponent

var growth_state: DataTypes.GrowthStates = DataTypes.GrowthStates.Seed

func _ready() -> void:
	watering_particles.emitting = false
	flowering_particles.emitting = false
	
	hurt_component.hurt.connect(on_hurt)
	grow_cycle_component.crop_maturity.connect(on_crop_maturity)
	grow_cycle_component.crop_harvesting.connect(on_crop_harvesting)

func _process(delta: float) -> void:
	#update visuals
	growth_state = grow_cycle_component.get_current_growth_state()
	sprite_2d.frame = growth_state
	
	if growth_state == DataTypes.GrowthStates.Maturity:
		flowering_particles.emitting = true


#watering
func on_hurt(hit_damage: int) -> void:
	if !grow_cycle_component.is_watered:
		#emit particles for a time
		watering_particles.emitting = true
		await get_tree().create_timer(5.0).timeout
		watering_particles.emitting = false
		grow_cycle_component.is_watered = true

func on_crop_maturity() -> void:
	flowering_particles.emitting = true

func on_crop_harvesting() -> void:
	var corn_harvesting_instance = corn_harvest_scene.instantiate() as Node2D
	corn_harvesting_instance.global_position = global_position
	get_parent().add_child(corn_harvesting_instance)
	queue_free()
