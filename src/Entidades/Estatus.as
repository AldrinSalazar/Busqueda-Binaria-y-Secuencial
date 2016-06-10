package Entidades 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Estatus extends Entity 
	{
		private var txt:Text;
		
		public function Estatus(x:Number=0, y:Number=0) 
		{
			super(x, y);
			txt = new Text("Buscando el elemento 44, 99 ciclos recorridos", 0, 0, {font:"aldrin", size: 72, width: 980, wordWrap: true, align: "center" });
			graphic = txt;
			
		}
		
		public function setText(t:String):void {
		txt.text = t;	
		}
	}

}