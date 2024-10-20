using Godot;
using System;

public partial class MenuButton : TextureButton
{
	public AudioStreamPlayer _audioPlayer;
	[Export] public AudioStream _sound;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		// Create a new AudioStreamPlayer instance for click sound
		_audioPlayer = new AudioStreamPlayer();
		AddChild(_audioPlayer);

		// Preload the click sound file
		//_sound = (AudioStream)GD.Load("res://assets/audio/effects/Transition Test 1.wav");
		if (_sound == null)
		{
			throw new NullReferenceException("Click audio file not found.");
		}
		_audioPlayer.Stream = _sound;

		// Connect signals
		Connect("pressed", new Callable(this, nameof(OnButtonPressed)));
	}

	private void OnButtonPressed()
	{
		_audioPlayer.Play();
	}
}
