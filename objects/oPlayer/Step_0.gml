/// @description Insert description here
// You can write your code in this editor
getInput();

xx = right - left;
yy = down - up;

var xSpeed = xx * accell;
var ySpeed = yy * accell;


x += xSpeed;

y += ySpeed;

if(xSpeed > 0){
	image_xscale = 1;
}else if(xSpeed < 0){
	image_xscale = -1;
}

if(xSpeed!=0){
	PlayerState = PlayerState.run
}else{
	PlayerState = PlayerState.idle
}

