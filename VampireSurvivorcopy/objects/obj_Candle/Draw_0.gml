
if (candleDeathTimer != -1) {
	image_alpha = candleDeathTimer / candleDeathTime;
}
draw_self();

if (global.Debug) {
	draw_text(x, y - 80, candleDeathTimer);	
}