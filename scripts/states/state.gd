class_name State
extends Node

func unhandled_input(event: InputEvent):
	pass

func process(delta: float):
	pass
	
func physics_process(delta: float):
	pass

func enter(message: Dictionary = {}):
	print("Entering %s" % name)
	#pass
	
func exit():
	print("Exiting %s" % name)
	#pass
