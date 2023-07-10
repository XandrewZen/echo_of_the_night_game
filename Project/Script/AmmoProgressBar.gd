extends Sprite


export var value = 20.00
export var max_value = 100.00

func _process(delta):
	$BG/Amount.scale.x = (value/max_value)
