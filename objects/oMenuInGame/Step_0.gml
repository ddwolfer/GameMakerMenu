/// @description Insert description here
// You can write your code in this editor
getInput()
if(select && room != rTitle){
	if( IGMenuScreen == IGMenuScreen.off ){ //off -> main
		IGMenuScreen = IGMenuScreen.main
		FreezeControl = true
		FreezeMove = true
		show_debug_message("on")
	}else if (IGMenuScreen == IGMenuScreen.main){//main -> off
		IGMenuScreen = IGMenuScreen.off
		FreezeControl = false
		FreezeMove = false
		show_debug_message("off")
	}else if ( IGMenuScreen == IGMenuScreen.option){ // option -> main
		IGMenuScreen = IGMenuScreen.main
	}
}

