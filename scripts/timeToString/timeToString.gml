var Hour = argument0
var Min = argument1
var Sec = argument2

if(Sec < 10){
	SecString = "0"+ string(Sec)
}else{
	SecString = string(Sec)
}
if(Min < 10){
	MinString = "0" + string(Min)
}else{
	MinString = string(Min)
}
if(Hour < 10){
	HourString = "0" + string(Hour)
}else{
	HourString = string(Hour)
}

return HourString + ":" + MinString + ":" + SecString