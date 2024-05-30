extends PanelContainer

@onready var property_container = %VBoxContainer

var property
var frames_per_second : String

# Called when the node enters the scene tree for the first time.
func _ready():
	#Set global variable reference to self in singleton
	Global.debug = self
	
	#hide debug on load
	visible = false
	
	#add_debug_property("FPS", frames_per_second)
	
func _process(delta):
	if visible:
		frames_per_second = "%.2f" % (1.0/delta)
		add_property("FPS", frames_per_second, 1)
	
func _input(event):
	#toggle debug panel
	if event.is_action_pressed("debug"):
		visible = !visible
		
func add_property(title: String, value, order):
	var target
	target = property_container.find_child(title, true, false)
	if !target:
		target = Label.new()
		property_container.add_child(target)
		target.name = title
		target.text = target.name + ": " + str(value)
	elif visible:
		target.text = title + ": " + str(value)
		property_container.move_child(target, order)



#DEPRECATED
#func add_debug_property(title: String, value):
	#property = Label.new()
	#property_container.add_child(property)
	#property.name = title
	#property.text = property.name + value
