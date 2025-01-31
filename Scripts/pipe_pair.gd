extends Node2D

class_name PipePair

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var speed = 0  # The speed at which the pipes move

signal bird_entered
signal point_scored

func set_speed(new_speed):
	speed = new_speed
	
func _process(delta):
	position.x += speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	bird_entered.emit()


func _on_scored_body_entered(body):
	point_scored.emit()
	audio_stream_player_2d.play()
	
