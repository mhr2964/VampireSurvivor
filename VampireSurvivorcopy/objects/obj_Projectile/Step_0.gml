projectileDuration -= 1;
if (projectileDuration <= 0 || projectilePiercing <= 0)
{
	projectileOnEnd();	
}
projectileMovement();
