if (levelUpScreen == true) {
	//Draw the screen for levle up and let player choose an upgrade
	draw_rectangle_color(room_width / 2 - room_width / 4, 
		room_height / 8, 
		room_width / 2 + room_width / 4,
		room_height * 7 / 8,
		c_gray, c_gray, c_gray, c_gray, false
		);
	/*
		Split it into 3
		Use levelUpChoices
	*/
	for (var i = 0; i < 3; i++) {
		var x1 = room_width / 2 - room_width / 4;
		var y1 = room_height / 8 + (room_height * i * 2 / 8);
		var x2 = room_width / 2 + room_width / 4;
		var y2 = room_height / 8 + (room_height * (i + 1) * 2 / 8);
		
		//Drawing divind gretctangles
		draw_rectangle_color(x1, 
		y1, 
		x2,
		y2, 
		c_white, c_white, c_white, c_white, true
		)

		//Drawing icons for what is upgraded
		draw_sprite(spr_upgradeIcons, levelUpChoices[i], x1, y1 + (y2 - y1) / 2);
		
		
		//Checking if mouse button is clicked in any of these boxes
		if (mouse_check_button_pressed(mb_left)) {
			if ((mouse_x >= x1) && (mouse_x <= x2) && (mouse_y > y1) && (mouse_y <= y2)) {
				show_message("Level up option " + string(i) + " selected"); 
				levelUpScreen = false;
				unPause();
				//I'm not making this a var because I need to use it with the with statement later
				upgradeIndex = levelUpChoices[i];
				
				if (upgradeIndex < sprite_get_number(spr_weapon)) {
					ds_list_set(obj_Player.playerWeaponLvlList, upgradeIndex, ds_list_find_value(obj_Player.playerWeaponLvlList, upgradeIndex) + 1);
					show_message("upgrade weapon");
				} else {
					upgradeIndex = upgradeIndex - sprite_get_number(spr_weapon);
					with (obj_Player) {
						
						passiveTypePreset(other.upgradeIndex, ds_list_find_value(playerPassiveList, other.upgradeIndex) + 1);	
					}
				}
			
				
			}
		}
		
		
	}
	

	
	
}






//Drawing all levels on the left 

//Drawing Weapons
var xOffset = 40;
var yOffset = 160;
var yDifference = 8;
var spriteScale = 1;
var sWidth = sprite_get_width(spr_weapon) * spriteScale 
if (instance_exists(obj_Player)) {
	for (var i = 0; i < ds_list_size(obj_Player.playerWeaponLvlList); i++) {
		draw_sprite_ext(spr_weapon, i, xOffset, yOffset + sWidth * i + yDifference, spriteScale, spriteScale, 0, c_white, 1);
		draw_text(xOffset + sWidth, yOffset + sWidth * i + yDifference, "Lvl: " + string(ds_list_find_value(obj_Player.playerWeaponLvlList, i)));
	}

	yOffset = 600;
	//Drawing Passives
	for (var i = 0; i < ds_list_size(obj_Player.playerPassiveList); i++) {
		draw_sprite_ext(spr_passiveItems, i, xOffset, yOffset + sWidth * i + yDifference, spriteScale, spriteScale, 0, c_white, 1);
		draw_text(xOffset + sWidth, yOffset + sWidth * i + yDifference, "Lvl: " + string(ds_list_find_value(obj_Player.playerPassiveList, i)));
		draw_text(xOffset + sWidth * 4, yOffset + sWidth * i + yDifference, "Value: " + string(obj_Player.passiveTypePreset(i, ds_list_find_value(obj_Player.playerPassiveList, i))));
	}
}


//Draw Screenflash
if (
