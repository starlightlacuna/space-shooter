# Adapted from GDQuest's Finite State Machine tutorial
# https://www.gdquest.com/tutorial/godot/design-patterns/finite-state-machine/
# Godot 3 version:
# https://github.com/gdquest-demos/godot-design-patterns/blob/bc28fff761055fbf821008bb3227168553622ed6/godot/StateMachine/StateMachine.gd

## Generic state machine. It initializes states and delegates engine callbacks
## (e.g. _physics_process and _unhandled_input) to the active state.
class_name StateMachine
extends Node

## Emitted when transitioning to a new state.
signal transitioned(state_name)

@export var initial_state: State

@onready var state := initial_state

func _ready() -> void:
	state.enter()
	
func _unhandled_input(event: InputEvent) -> void:
	var state_transition: StateTransition = state.unhandled_input(event)
	if state_transition:
		transition_to(state_transition.target_state, state_transition.message)

func _process(delta: float) -> void:
	var state_transition: StateTransition = state.process(delta)
	if state_transition:
		transition_to(state_transition.target_state, state_transition.message)

func _physics_process(delta: float) -> void:
	var state_transition: StateTransition = state.physics_process(delta)
	if state_transition:
		transition_to(state_transition.target_state, state_transition.message)
	
func transition_to(target_state: State, message: Dictionary = {}) -> void:
	state.exit()
	state = target_state
	state.enter(message)
	transitioned.emit(target_state.name)
