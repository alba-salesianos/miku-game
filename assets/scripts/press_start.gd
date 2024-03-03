extends RichTextLabel

@export var speed : int = 5
@export var fade : bool = false

var time = 0
var sinTime = 0
var _visible = true

func flashText():
	if !fade:
		if sinTime > 0:
			_visible = true
		else:
			_visible = false
	else:
		_visible = true
		modulate.a = sinTime
		
	visible = _visible
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	sinTime = sin(time*speed)
	flashText()
