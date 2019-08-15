/// @description Insert description here
// You can write your code in this editor
StepCount ++

if( StepCount % room_speed == 0 ){
	Sec++
	StepCount = 0
}

Mins = ( Sec - (Sec%60) ) / 60

draw_set_font(fontDefault)
draw_text(25,50,string(Mins) + ":" + string(Sec - Mins*60))