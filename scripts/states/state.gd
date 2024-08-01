class_name State
extends Node

func unhandled_input(_event: InputEvent) -> Variant:
	return

func process(_delta: float) -> Variant:
	return
	
func process_physics(_delta: float) -> Variant:
	return

func enter(_message: Dictionary = {}) -> void:
	print("Entering %s" % name)
	
func exit() -> void:
	print("Exiting %s" % name)
