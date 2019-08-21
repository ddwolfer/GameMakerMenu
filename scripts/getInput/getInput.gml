if(!oGame.FreezeControl){
	up = keyboard_check(vk_up); 
	down = keyboard_check(vk_down);
	left = keyboard_check(vk_left);
	right = keyboard_check(vk_right);
	start = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
	select = keyboard_check_pressed(vk_escape);
	upMenu = keyboard_check_pressed(vk_up); 
	downMenu = keyboard_check_pressed(vk_down);
	leftMenu = keyboard_check_pressed(vk_left);
	rightMenu = keyboard_check_pressed(vk_right);
	mouseLeft = mouse_check_button(mb_left);
	mouseLeftClick = mouse_check_button_pressed(mb_left)
}else{
	up = 0
	down = 0
	left = 0
	right = 0
	start = 0
	select = 0
	upMenu = 0
	downMenu = 0
	leftMenu = 0
	rightMenu = 0
	mouseLeft = 0
	mouseLeftClick = 0
}

