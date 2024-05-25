# AudioPlayer.gd (autoload singleton)
extends Node

# Dictionary mapping sound names to their AudioStreamPlayer nodes
@onready var sfx_dict = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	# Attempt to get the nodes manually
	sfx_dict["bonk"] = get_node("bonk")
	sfx_dict["game_start"] = get_node("game_start")
	sfx_dict["goal"] = get_node("goal")

	# Print the results for debugging
	for key in sfx_dict.keys():
		if not sfx_dict[key]:
			print("Error: Node for sound effect not found for name:", key)
		else:
			print("Node found for sound effect:", key)

# Plays the specified sound effect
func play_sfx(sfx_name: String):
	var asp: AudioStreamPlayer2D = sfx_dict.get(sfx_name, null)
	print("Attempting to play sound:", sfx_name)

	if asp != null:
		print("Playing sound:", sfx_name)
		asp.play()
	else:
		print("Error: Sound effect not found for name:", sfx_name)
