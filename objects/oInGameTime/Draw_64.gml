/// @description Insert description here
// You can write your code in this editor
if(room != rTitle){
	StepCount ++
}
//偵數轉秒
if( StepCount % room_speed == 0  && StepCount!=0){
	Sec++
	StepCount = 0
}
//秒轉分
if( Sec % 60 == 0 && Sec != 0){
	Mins++
	Sec = 0
}
//分轉小時
if(Mins % 60 == 0 && Mins != 0){
	Hours++
	Mins = 0
}

if(room!=rTitle){
	draw_set_font(fontDefault)
	draw_text(25,50, timeToString(Hours, Mins, Sec) )
}
