extends BaseDeathHandler

@export var seconds_until_death: int

@export var animation_player: AnimationPlayer

@export var pterodactyl_sound: AudioStream
@export var pterodactyl_sound_attack: AudioStream
@export var player_held_locatoin_offset: Vector2 = Vector2(0, 10)

var audio_player: AudioStreamPlayer
var timer: Timer
var started_interaction: bool = false

@onready var pterodactyl: Sprite2D = %Pterodactyl
@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D

# Initialise any dependencies.
func _ready() -> void:
	super._ready()
	_init_audio_player()
	_init_animation_player()
	_init_timer()

func _init_audio_player() -> void:
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)
	audio_player.stream = pterodactyl_sound

func _init_animation_player() -> void:
	animation_player.animation_finished.connect(func(animation_name): _on_death_end())

func _init_timer() -> void:
	timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = seconds_until_death
	timer.timeout.connect(_on_death_start)
	add_child(timer)

#func _input(event: InputEvent) -> void:
	#return
	#if event is InputEventKey and event.pressed:
		#if timer.is_stopped() == false:
			#print("Cancelling death...")
			#timer.stop()

func on_interact() -> void:
	if started_interaction:
		return
	started_interaction = true
	if timer.is_stopped():
		print("Starting timer...")
		var player = get_tree().get_first_node_in_group("Player")
		player.Disable()
		timer.start()
		audio_player.stream = pterodactyl_sound
		audio_player.play()

func on_death_start() -> void:
	audio_player.stop()
	audio_player.stream = pterodactyl_sound_attack
	audio_player.play()
	animation_player.play("pterodactyl_swoop")
	await animation_player.animation_finished

func grab_player():
	var current_cam_position = get_viewport().get_camera_2d().global_position
	var dead_camera = get_viewport().get_camera_2d().duplicate()
	add_child(dead_camera)
	dead_camera.global_position = current_cam_position
	#get_viewport().get_camera_2d().process_mode = Node.PROCESS_MODE_DISABLED
	var player = get_tree().get_first_node_in_group("Player")
	var player_parent = player.get_parent()
	#var tween = get
	player.global_position = animated_sprite_2d.global_position + player_held_locatoin_offset
	player.reparent(pterodactyl)
	player.show_behind_parent = true
	await animation_player.animation_finished
	await SceneTransitionManager.faded_out
	dead_camera.queue_free()
	player.show_behind_parent = false
	player.reparent(player_parent)
	await SceneTransitionManager.faded_in
	player.Enable()
