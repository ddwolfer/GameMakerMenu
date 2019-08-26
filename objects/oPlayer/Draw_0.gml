/// @description Insert description here
// You can write your code in this editor
switch(PlayerState){
	case PlayerState.idle:
		image_speed = 0.3
        sprite_index = sPlayerIdle
		break
	case PlayerState.run:
		image_speed = 0.5
        sprite_index = sPlayerRun
		break
	
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha)