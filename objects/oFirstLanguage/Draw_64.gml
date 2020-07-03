/// @description Insert description here
// You can write your code in this editor
var MX = window_mouse_get_x()
var MY = window_mouse_get_y()
//底色
draw_set_color($006479)
draw_rectangle( MainDivX1, MainDivY1, MainDivX2, MainDivY2, 0)
//標題底色
draw_set_color(c_gray)
draw_rectangle( MainTitleX1, MainTitleY1, MainTitleX2, MainTitleY2, 0)
//標題
draw_set_font(MenuFont)
draw_set_color(c_black)
draw_set_halign(fa_middle)
draw_set_valign(fa_middle)
draw_text(MainTitleCenterXY[0],MainTitleCenterXY[1],Title)
//語言框框
for( var i=0 ; i<LanguageRowNum ; i++ ){
	var BoxY1 = ContentDivYMin + (LanguageBoxYSpace * (i+1)) + (LanguageBoxHeight * i)
	var BoxY2 = ContentDivYMin + (LanguageBoxYSpace * (i+1)) + (LanguageBoxHeight * (i+1))
	
	draw_set_color(c_olive)
	draw_rectangle(LanguageBoxX1[0],BoxY1,LanguageBoxX2[0],BoxY2,0)
	draw_set_color(c_black)
	var textX = (LanguageBoxX1[0] + LanguageBoxX2[0]) / 2
	var textY = (BoxY1 + BoxY2)/2
	draw_text(textX,textY,languageOptions[i*2])
	if(ChoicePointer == i*2){
		draw_rectengle_width( LanguageBoxX1[0],BoxY1,LanguageBoxX2[0],BoxY2, 4,c_white)
	}
	if( (array_length_1d(languageOptions)-(i*2))/2 >= 1 ){
		draw_set_color(c_olive)
		draw_rectangle(LanguageBoxX1[1],BoxY1,LanguageBoxX2[1],BoxY2,0)
		draw_set_color(c_black)
		var textX = (LanguageBoxX1[1] + LanguageBoxX2[1]) / 2
		var textY = (BoxY1 + BoxY2)/2
		draw_text(textX,textY,languageOptions[i*2+1])
		if(ChoicePointer == i*2+1){
			draw_rectengle_width( LanguageBoxX1[1],BoxY1,LanguageBoxX2[1],BoxY2, 4,c_white)
		}
	}
}
//退出遊戲
if( ( MX >= quitButtonX1	&& MX <= quitButtonX2 ) && ( MY >= quitButtonY1	&& MY <= quitButtonY2 )  ){
	draw_set_color(c_red)
	draw_rectangle(quitButtonX1 , quitButtonY1 , quitButtonX2 , quitButtonY2 , 0)
	draw_set_color(c_white)
}else{
	draw_set_color($00009B)
	draw_rectangle(quitButtonX1 , quitButtonY1 , quitButtonX2 , quitButtonY2 , 0)
	draw_set_color(c_white)
}
draw_line_width( quitButtonLineX1, quitButtonLineY1, quitButtonLineX2 ,quitButtonLineY2,10)
draw_line_width( quitButtonLineX2, quitButtonLineY1, quitButtonLineX1 ,quitButtonLineY2,10)

switch(FirstScreen){
	case FirstScreen.main:
	#region

		break
	#endregion
	case FirstScreen.quitGame:
	#region
		//底色
		draw_set_color(c_black)
		draw_set_alpha(0.5)
		draw_rectangle(0,0,1920,1080,0)
		draw_set_alpha(1)
		draw_set_color(c_gray)
		draw_rectangle(quitBackgroundX1 , quitBackgroundY1 , quitBackgroundX2 ,quitBackgroundY2 ,0)
		
		//滑鼠判定
		draw_set_color($3F3F3F)
		//是 yes quitPointer
		if( quitPointer == 0 ){
			draw_rectangle(YesBoxX1, YesBoxY1, YesBoxX2, YesBoxY2 ,0)
		}
		
		//否 no
		if( quitPointer == 1 ){
			draw_rectangle(NoBoxX1, NoBoxY1, NoBoxX2, NoBoxY2 ,0)
		}
		draw_set_color(c_white)
		
		//文字
		draw_set_color(c_white)
		draw_set_halign(fa_center)
		draw_set_valign(fa_center)
		draw_text(quitAlarm_X ,quitAlarm_Y, quitAlarm)
		draw_text(NoText_X , CheckText_Y , YesOrNo[0])
		draw_text(YesText_X , CheckText_Y , YesOrNo[1])
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		break
	#endregion
}