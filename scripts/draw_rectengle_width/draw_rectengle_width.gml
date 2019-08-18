var x1 = argument0
var y1 = argument1
var x2 = argument2
var y2 = argument3
var width = argument4
var color = argument5

draw_set_color(color)

for (var i = 0 ; i < width ; i++){
	draw_rectangle(x1 + i,y1 + i ,x2 - i ,y2 - i,1)
}

draw_set_color(c_white)