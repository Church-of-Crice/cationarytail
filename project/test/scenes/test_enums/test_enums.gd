extends Node2D

enum MyEnum { VALUE_ONE, VALUE_TWO, VALUE_THREE }

func _ready():
    # To get all the enum names (keys)
    for key in MyEnum.keys():
        print("Enum Name: ", key)
        print(MyEnum.get(key))
