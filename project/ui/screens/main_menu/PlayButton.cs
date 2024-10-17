using Godot;
using System;

public partial class PlayButton : TextureButton
{
    private AudioStreamPlayer _audioPlayer;
    private AudioStreamPlayer _hoverAudioPlayer;
    private AudioStream _correctSound;
    private AudioStream _hoverSound;

    // Called when the node enters the scene tree for the first time.
    public override void _Ready()
    {
        // Create a new AudioStreamPlayer instance for click sound
        _audioPlayer = new AudioStreamPlayer();
        AddChild(_audioPlayer);

        // Preload the click sound file
        _correctSound = (AudioStream)GD.Load("res://assets/audio/effects/Transition Test 1.wav");
        if (_correctSound == null)
        {
            throw new NullReferenceException("Click audio file not found.");
        }
        _audioPlayer.Stream = _correctSound;

        // Create a new AudioStreamPlayer instance for hover sound
        _hoverAudioPlayer = new AudioStreamPlayer();
        AddChild(_hoverAudioPlayer);

        // Preload the hover sound file
        _hoverSound = (AudioStream)GD.Load("res://assets/audio/effects/pyrite7-32248.mp3");
        if (_hoverSound == null)
        {
            throw new NullReferenceException("Hover audio file not found.");
        }
        _hoverAudioPlayer.Stream = _hoverSound;

        // Connect signals
        Connect("pressed", new Callable(this, nameof(OnButtonPressed)));
        Connect("mouse_entered", new Callable(this, nameof(OnMouseEntered)));
        Connect("mouse_exited", new Callable(this, nameof(OnMouseExited)));
    }

    private void OnButtonPressed()
    {
        _audioPlayer.Play();
        //get_tree().change_scene_to_packed.call_deferred(SceneManager.CHARACTER_CREATION_SCREEN)
    }

    private void OnMouseEntered()
    {
        _hoverAudioPlayer.Play();
    }

    private void OnMouseExited()
    {
        // Optionally, stop the hover sound or handle other effects
    }

    public override void _Process(double delta)
    {
        // No need to check and play the sound here anymore
    }
}