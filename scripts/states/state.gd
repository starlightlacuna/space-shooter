class_name State
extends Node

func unhandled_input(_event: InputEvent):
	pass

func process(_delta: float):
	pass
	
func process_physics(_delta: float):
	pass

func enter(_message: Dictionary = {}):
	print("Entering %s" % name)
	#pass
	
func exit():
	print("Exiting %s" % name)
	#pass
