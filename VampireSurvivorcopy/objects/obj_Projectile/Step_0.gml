projectileDuration -= 1;
if (projectileDuration <= 0 || projectilePiercing <= 0)
{
	projectileOnEnd();	
}
if (projectileDestroyOffScreen)
{
	if((x < 0 - sprite_width / 2 || x > room_width + sprite_width / 2) || 
	   (y < 0 - sprite_height / 2 || y > room_width + sprite_height / 2))
	{
		projectileOnEnd();
	}
}
projectileMovement();
