/// @description Insert description here
// You can write your code in this editor

width = display_get_gui_width();
height = display_get_gui_height();

transitionAlpha = 0

doTransition = false
targetRoom = noone

global.playingSave = 0

FreezeControl = false
FreezeMove = false
FreezeMouse = false
MouseChangeFlag = true
window_set_cursor(cr_default)

tempMouseX = mouse_x
tempMouseY = mouse_y
