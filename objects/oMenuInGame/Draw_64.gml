/// @description Insert description here
// You can write your code in this editor

switch(IGMenuScreen){
	
	case IGMenuScreen.main:
	#region draw black background
		draw_set_alpha(0.4);
		draw_set_color(c_black);
		draw_rectangle(0,0,640 * global.windowsSize,360* global.windowsSize,false);
		draw_set_alpha(1)
		#endregion
	for( var line = 0 ; line < array_length_1d(IGMainMenuText) ; line++){
		draw_set_valign(fa_middle)
		draw_set_halign(fa_middle)
		draw_set_color(c_white)
		draw_set_font(MenuFont)
		draw_text(320 * global.windowsSize, 180* global.windowsSize + ((line-1)*50), IGMainMenuText[global.gameLanguage,line])
		draw_set_valign(fa_top)
		draw_set_halign(fa_left)
	}
	
	break
	
	case IGMenuScreen.option:
	break
}