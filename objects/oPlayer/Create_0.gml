/// @description Insert description here
// You can write your code in this editor
/// @description 
xSpeed = 0;
ySpeed = 0
accell = 3


control = true;
depth = 10;

enum PlayerState{
	idle = 0,
	run = 1,
	attack = 2,
	playDeath = 3
}
PlayerState = PlayerState.idle