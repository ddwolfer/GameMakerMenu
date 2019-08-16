/// @description Insert description here
// You can write your code in this editor
//換房間
if(doTransition){
	if(room != targetRoom) {
		transitionAlpha += 0.1;
		if(transitionAlpha >= 1) {
			room_goto(targetRoom);
		}
	}else{
		transitionAlpha -= 0.1;
		if(transitionAlpha <= 0) doTransition = false;
	}
	
	draw_set_alpha(transitionAlpha);
	draw_rectangle_color(0, 0, width, height,  c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}