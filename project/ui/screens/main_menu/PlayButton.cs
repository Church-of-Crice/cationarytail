using Godot;
using System;

public partial class PlayButton : TextureButton
{
    private AudioStreamPlayer _audioPlayer;
    private AudioStreamPlayer _hoverAudioPlayer;
    private AudioStream _correctSound;
    private AudioStream _hoverSound;
    private Vector2 _originalScale;
    private Color _originalColor;

    public override void _Ready()
    {
        // Create a new AudioStreamPlayer instance for click sound
        _audioPlayer = new AudioStreamPlayer();
        AddChild(_audioPlayer);

        // Preload the click sound file
        _correctSound = (AudioStream)GD.Load("res://assets/audio/effects/Transition Test 1.wav");
        _audioPlayer.Stream = _correctSound;

        // Create a new AudioStreamPlayer instance for hover sound
        _hoverAudioPlayer = new AudioStreamPlayer();
        AddChild(_hoverAudioPlayer);

        // Preload the hover sound file
        _hoverSound = (AudioStream)GD.Load("res://assets/audio/effects/pyrite7-32248.mp3");
        _hoverAudioPlayer.Stream = _hoverSound;

        // Connect signals
        Connect("pressed", new Callable(this, nameof(OnButtonPressed)));
        Connect("mouse_entered", new Callable(this, nameof(OnMouseEntered)));
        Connect("mouse_exited", new Callable(this, nameof(OnMouseExited)));

        // Store the original scale and color
        _originalScale = Scale;
        _originalColor = Modulate;
    }

    private void OnButtonPressed()
    {
        _audioPlayer.Play();
        // You can call deferred scene change here if you uncomment this line
        // get_tree().ChangeSceneToPacked(SceneManager.CHARACTER_CREATION_SCREEN);
    }

    private void OnMouseEntered()
    {
        // Play hover sound
        _hoverAudioPlayer.Play();

        // Make button bigger and change color
        Scale = _originalScale * 1.1f; // Scale the button up by 20%
        Modulate = new Color(1, 1, 6, 0.8f); // Change the button's color to be slightly transparent
    }

    private void OnMouseExited()
    {
        // Reset the button scale and color
        Scale = _originalScale; // Reset the scale to original
        Modulate = _originalColor; // Reset the color to original
    }
    public override void _Process(double delta)
    {
        // No need to check and play the sound here anymore
    }
}
