projectileDuration -= 1;
if (projectileDuration <= 0)
{
	projectileOnEnd();	
}
projectileMovement();
