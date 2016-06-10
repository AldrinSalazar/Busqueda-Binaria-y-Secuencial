package Entidades 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.motion.LinearMotion;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Flecha extends Entity 
	{
		[Embed(source = "../../img/flecha.png")]
		public static const FLECHA:Class;
		
		public function Flecha(x:Number=0, y:Number=0, otroColor:Boolean = false) 
		{
			super(x, y);
			var m:Image = new Image(FLECHA);
			graphic = m;
			layer = 0;
			
			if (otroColor) {
				m.tintMode = Image.TINTING_COLORIZE;
				m.color = 0x31DF6D;
			}
		}
		
	}

}