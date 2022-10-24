if (keyboard_check(ord("W")) || (keyboard_check(vk_up))) global.upKey = 1;
else global.upKey = 0;
if (keyboard_check(ord("S")) || (keyboard_check(vk_down))) global.downKey = 1;
else global.downKey = 0;
if (keyboard_check(ord("D")) || (keyboard_check(vk_right))) global.rightKey = 1;
else global.rightKey = 0;
if (keyboard_check(ord("A")) || (keyboard_check(vk_left))) global.leftKey = 1;
else global.leftKey = 0;



if (keyboard_check_pressed(ord("1"))) {
	room_goto(room_FletcherTesting);	
}
if (keyboard_check_pressed(ord("2"))) {
	room_goto(room_MichaelTesting);	
}