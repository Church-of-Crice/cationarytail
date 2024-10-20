extends BaseDeathHandler

@export var seconds_until_death: int

@export var pterodactyl_sound: AudioStream

var audio_player: AudioStreamPlayer;
var timer: Timer

func _ready() -> void:
	super._ready()
	_init_audio_player()
	_init_timer()

func _init_audio_player() -> void:
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)
	audio_player.stream = pterodactyl_sound

func _init_timer() -> void:
	timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = seconds_until_death
	timer.timeout.connect(on_death_start)
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
	print("Pterodactyl")
	audio_player.play()
	# TODO: Animate pterodactyl.
	_on_death_end()
