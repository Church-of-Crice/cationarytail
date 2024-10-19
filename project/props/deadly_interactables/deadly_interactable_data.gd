class_name DeadlyInteractableData extends Resource

## Indicates the player has interacted with the item and
## the process of dying by this method should start
signal interacted

@export var world_sprite: Texture2D
@export var death_type: CharacterData.DeathType
