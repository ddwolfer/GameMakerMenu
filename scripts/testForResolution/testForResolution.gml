getInput()

if(upMenu){
	switch(windowsSize){
		case 1:
			window_set_size(1920,1080)
			windowsSize = 3
			break
		case 2:
			window_set_size(640,360)
			windowsSize = 1
			break
		case 2.25:
			window_set_size(1280,720)
			windowsSize = 2
			break
		case 3:
			window_set_size(1440,810)
			windowsSize = 2.25
			break
	}
}
if(downMenu){
	switch(windowsSize){
		case 1:
			window_set_size(1280,720)
			windowsSize = 2
			break
		case 2:
			window_set_size(1440,810)
			windowsSize = 2.25
			break
		case 2.25:
			window_set_size(1920,1080)
			windowsSize = 3
			break
		case 3:
			window_set_size(640,360)
			windowsSize = 1
			break
	}
}
if(keyboard_check_pressed(ord("F"))){
	if(window_get_fullscreen()){
		window_set_fullscreen(0)
	}else{
		window_set_fullscreen(1)
	}
}
