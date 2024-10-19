extends Area2D

@onready var thought_bubble: ThoughtBubbleContainer = %ThoughtBubble

func think_text(text: String):
	thought_bubble.start_thought_text(text)

func think_image(texture: Texture2D, time: float = 3.0):
	thought_bubble.start_thought_image(texture, time)
