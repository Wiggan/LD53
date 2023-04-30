@tool
extends RichTextEffect
class_name RichTextUpdate

# Define the tag name.
var bbcode = "update"

func _process_custom_fx(char_fx):
	var color = Color("#68c2d3")
	char_fx.color = char_fx.color.lerp(color, 1 / (1+char_fx.elapsed_time))
	char_fx.offset = Vector2(40, 0) * 1 / (1+char_fx.elapsed_time*50)
	return true
