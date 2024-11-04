extends Node2D

@export var dialogs: Array[DialogSequence]
@export var clerk_dialog_after_animals: DialogSequence

signal dialogs_completed

var dialog_needed_count := dialogs.size()
var dialogs_compelted := 0

var clerk: ShelterClerk
@onready var counter_barrier: StaticBody2D = %CounterBarrier

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  dialog_needed_count = dialogs.size()
  clerk = get_tree().get_first_node_in_group("ShelterClerk")
  await clerk.get_current_dialog().finished
  counter_barrier.close()
  await_dialogs()
  await dialogs_completed
  add_clerk_dialog()
  await clerk.get_current_dialog().finished
  SceneTransitionManager.change_scene_with_transition(SceneManager.CHARACTER_CREATION_SCREEN, SceneManager.FADE_TRANSITION)
  

func add_clerk_dialog():
  clerk.set_dialog(clerk_dialog_after_animals)
  # TODO: Add clerk alert!

func _on_dialog_complete():
  dialogs_compelted += 1
  if dialog_needed_count == dialogs_compelted:
    dialogs_completed.emit()
    

func await_dialogs():
  for dialog in dialogs:
    dialog.finished.connect(_on_dialog_complete)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  pass


func await_signals(signals: Array) -> Array:
    var results = []
    for awaited_signal in signals:
        results.append(await awaited_signal.finished)
    return results
