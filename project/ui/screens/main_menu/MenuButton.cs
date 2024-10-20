using Godot;
using System;

public partial class MenuButton : TextureButton
{
    private AudioStreamPlayer _audioPlayer;
    private AudioStream _correctSound;
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
        // GetTree().CallDeferred("change_scene_to_packed", SceneManager.CHARACTER_CREATION_SCREEN);
    }

    private void OnMouseEntered()
    {
        // Make button bigger and change color
        Scale = _originalScale * 1.1f; // Scale the button up by 10%
        
       // Modulate = new Color(106 / 255f, 213 / 255f, 255 / 255f, 0.8f); 
           Modulate = new Color(1, 1, 1, 0.9f); // Change the button's color to white with 80% opacity// Change the button's color to (106, 213, 255) with 80% opacity
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