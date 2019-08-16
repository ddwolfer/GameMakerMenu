/// @description Insert description here
// You can write your code in this editor
StepCount ++
//偵數轉秒
if( StepCount % room_speed == 0 ){
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
if(Sec < 10){
	SecStr = "0"+ string(Sec)
}else{
	SecStr = string(Sec)
}
if(Mins < 10){
	MinStr = "0" + string(Mins)
}else{
	MinStr = string(Mins)
}
if(Hours < 10){
	HourStr = "0" + string(Hours)
}else{
	HourStr = string(Hours)
}


draw_set_font(fontDefault)
draw_text(25,50,HourStr + ":" + MinStr + ":" + SecStr )