extends BaseDeathHandler

@export var seconds_until_death: int

@export var animation_player: AnimationPlayer

@export var pterodactyl_sound: AudioStream

var audio_player: AudioStreamPlayer
var timer: Timer

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

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if timer.is_stopped() == false:
			print("Cancelling death...")
			timer.stop()

func on_interact() -> void:
	if timer.is_stopped():
		print("Starting timer...")
		timer.start()

func on_death_start() -> void:
	audio_player.play()
	animation_player.play("pterodactyl_swoop")
