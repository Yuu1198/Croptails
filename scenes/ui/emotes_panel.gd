extends Panel

@onready var animated_sprite_2d = $Emote/AnimatedSprite2D
@onready var emote_idle_timer = $EmoteIdleTimer

var idle_emotes: Array = ["emote_1_idle", "emote_2_smile", "emote_3_ear_wave", "emote_4_blink"]

func _ready():
	animated_sprite_2d.play("emote_1_idle")

func play_emote(animation: String) -> void:
	animated_sprite_2d.play(animation)

#randomly plays one of the emotes of array
func _on_emote_idle_timer_timeout():
	var index = randi_range(0, 3)
	var emote = idle_emotes[index]
	
	animated_sprite_2d.play(emote)
