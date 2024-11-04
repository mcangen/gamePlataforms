# GlobalSound.gd
extends Node

@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Variable para almacenar el estado del volumen
var is_muted: bool = false

func _ready() -> void:
	# Verificar y reproducir el sonido si autoplay no está activado desde el editor
	if audio_player and not audio_player.playing:
		audio_player.play()

func play_sound():
	if audio_player:
		audio_player.play()

func stop_sound():
	if audio_player:
		audio_player.stop()

func toggle_mute():
	if audio_player:
		is_muted = not is_muted
		if is_muted:
			audio_player.volume_db = -80  # Silenciar
		else:
			audio_player.volume_db = 0  # Restaurar al volumen original

func set_volume(value: float):
	if audio_player and not is_muted:
		audio_player.volume_db = value
