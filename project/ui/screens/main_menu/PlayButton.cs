using Godot;
using System;

public partial class PlayButton : TextureButton
{
    private AudioStreamPlayer _audioPlayer;
    private AudioStreamPlayer _hoverAudioPlayer;

    // Called when the node enters the scene tree for the first time.
    public override void _Ready()
    {
        _audioPlayer = GetNode<AudioStreamPlayer>("AudioStreamPlayer");

        // Load the audio stream for the click sound
        var clickAudioStream = (AudioStream)ResourceLoader.Load("res://assets/audio/effects/Transition Test 1.wav");
        _audioPlayer.Stream = clickAudioStream;

        // Load the audio stream for the hover sound
        _hoverAudioPlayer = new AudioStreamPlayer();
        AddChild(_hoverAudioPlayer);
        var hoverAudioStream = (AudioStream)ResourceLoader.Load("res://assets/audio/effects/HoverSound.wav");
        _hoverAudioPlayer.Stream = hoverAudioStream;

        Connect("pressed", new Callable(this, nameof(OnButtonPressed)));
        Connect("mouse_entered", new Callable(this, nameof(OnMouseEntered)));
        Connect("mouse_exited", new Callable(this, nameof(OnMouseExited)));
    }

    private void OnButtonPressed()
    {
        _audioPlayer.Play();
    }

    private void OnMouseEntered()
    {
		//log
		GD.Print("Mouse entered");
        _hoverAudioPlayer.Play();
    }

    private void OnMouseExited()
    {
        // Optionally, stop the hover sound or handle other effects
    }

    // Called every frame. 'delta' is the elapsed time since the previous frame.
    public override void _Process(double delta)
    {
    }
}