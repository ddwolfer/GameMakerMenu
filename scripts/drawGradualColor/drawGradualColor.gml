var x1 = argument0
var y1 = argument1 + (((argument3 - argument1)/10)*1)
var x2 = argument2
var y2 = argument1 + (((argument3 - argument1)/10)*9)
var color = argument4

drawGradualY = (y2-y1)/2000
drawGradualX = (x2-x1)/2000

for(var i = 0 ; i < 2000 ; i++){
	draw_set_alpha( (2000-i)/2000 )
	draw_set_color(color)
	draw_rectangle(x1+(i*drawGradualX),		y1,
				   x1+((i+1)*drawGradualX),	y2,0)
}
draw_set_alpha(1)