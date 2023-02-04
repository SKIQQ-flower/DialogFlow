tool
extends EditorPlugin

export onready var gameState
export onready var currentDialog
const AUTOLOAD = "Dialogg"
var settings


func _enter_tree():
	settings = preload("res://addons/DialogFlow/Scenes/DialogFlow.tscn").instance()
	add_autoload_singleton(AUTOLOAD, "res://addons/DialogFlow/dialogg.gd")
	get_editor_interface().get_editor_viewport().add_child(settings)
	make_visible(false)
	
func _exit_tree():
	if settings:
		settings.queue_free()

func make_visible(v):
	if is_instance_valid(settings):
		settings.visible = v

func has_main_screen():
	return true

func get_plugin_name():
	return "DialogFlow"
