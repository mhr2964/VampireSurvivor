

function projectileOnEnd()
{
	instance_destroy();	
}

function projectileMovement()
{
	switch(projectileType)
	{
		case "test":
			x += lengthdir_x(3, point_direction(x, y, obj_Enemy.x, obj_Enemy.y));
			y += lengthdir_y(3, point_direction(x, y, obj_Enemy.x, obj_Enemy.y));
			break;
		case 0:
			//Knife
			image_xscale = projectileDirection;
			x += projectileMoveSpeed * projectileDirection;
			break;
		case 1:
			//Axe
			image_xscale = projectileDirection;
			image_angle += projectileRotationSpeed;
			x += projectileXSpeed;
			y += projectileYSpeed;
			if (projectileYSpeed < projectileYMax)
			{
				projectileYSpeed += projectileGravity
			}
			break;
	}
}

function projectileTypePreset(type, lvl) {
	
	sprite_index = spr_weapon;
	image_index = type;
	projectileType = type;
	projectileLevel = lvl;
	
	switch (type) {
		case 0:
			//knife 
			//unchanging stuff
			destroyOffScreen = false;
			projectileDuration = 600;
			
			
			//Base lvl 0 stats
			projectileDamage = 1;
			projectileExtraAmount = 0;
			projectilePiercing = 1;
			projectileMoveSpeed = 10;
			projectileCooldown = 60;
			projectileKnockback = 5;
			projectileTimeBetweenShots = 15;
			
			if (lvl >= 1) projectileDamage += 5;
			if (lvl >= 2) projectilePiercing += 1;
			if (lvl >= 3) projectileExtraAmount += 1;
			if (lvl >= 4) projectileMoveSpeed += 5;
			if (lvl >= 5) projectileDamage += 5;
			if (lvl >= 6) projectileExtraAmount += 1;
			if (lvl >= 7) projectileMoveSpeed += 5;
			if (lvl >= 8) projectilePiercing += 1;
			if (lvl >= 9) projectileExtraAmount += 1;
			if (lvl >= 10) {
				projectileDamage += 10;
				projectileExtraAmount += 1;
				projectilePiercing += 1;
				projectileMoveSpeed += 1;
			}


			break;
		case 1:
			//axe 
			//unchanging stuff
			destroyOffScreen = true;
			projectileDuration = 600;
			projectileGravity = .3;
			projectileXSpeed = random_range(-3, 3);
			projectileYSpeed = -10;
			projectileYMax = 20;
			projectileRotationSpeed = 6;
			
			//Base lvl 0 stats
			projectileDamage = 1;
			projectileExtraAmount = 0;
			projectilePiercing = 1;
			projectileMoveSpeed = 10;
			projectileCooldown = 60;
			projectileKnockback = 20;
			projectileTimeBetweenShots = 10;
			
			if (lvl >= 1) projectileDamage += 5;
			if (lvl >= 2) projectilePiercing += 1;
			if (lvl >= 3) projectileExtraAmount += 1;
			if (lvl >= 4) projectileDamage += 5;
			if (lvl >= 5) projectileDamage += 5;
			if (lvl >= 6) projectileExtraAmount += 1;
			if (lvl >= 7) projectileDamage += 5;
			if (lvl >= 8) projectilePiercing += 1;
			if (lvl >= 9) projectileExtraAmount += 1;
			if (lvl >= 10) {
				projectileDamage += 10;
				projectileExtraAmount += 1;
				projectilePiercing += 1;
				projectileMoveSpeed += 1;
			break;
		
			}
	}
}

