package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author @SAldrin
	 */
	
	public class Main extends Engine
	{
		[Embed(source="../img/OldSansBlack.ttf", fontFamily="aldrin", embedAsCFF="false")]
		public static var COMFORTAA:Class;
		
		public function Main() 
		{
			super(1000, 800);
			FP.world = new Menu();
			//FP.console.enable();
			FP.console.toggleKey = Key.G;
			
		}
		
		
	}
	
}