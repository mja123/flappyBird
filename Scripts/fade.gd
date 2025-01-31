extends Node

class_name Fade

@onready var animation_player = $AnimationPlayer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func play():
	animation_player.play("fade")
	audio_stream_player_2d.play()


func _on_animation_player_animation_finished(anim_name):
	await audio_stream_player_2d.finished
	queue_free()
