extends Area2D

@onready var thought_bubble: ThoughtBubbleContainer = %ThoughtBubble

func think_text(text: String):
	thought_bubble.start_thought_text(text)
