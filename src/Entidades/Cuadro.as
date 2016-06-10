package Entidades 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Ease;
	
	/**
	 * ...
	 * @author @SAldrin
	 */
	
	public class Cuadro extends Entity 
	{
		[Embed(source = "../../img/caja.png")]
		public static const BG:Class;
		
		private var fondo:Image;
		private var valorTxt:Text;
		public var valor:uint;
		
		private var sel:Boolean = false;
		
		public function Cuadro(x:Number=0, y:Number=0, valor:uint=0) 
		{
			super(x, y);
			this.valor = valor;
			
			var px:uint = valor < 10 ? 11:(valor < 99 ? 6:0);
			valorTxt = new Text(valor.toString(), 0, 0, { font: "aldrin", color: 0x000000, size: 20, align:"center" } );
			valorTxt.centerOO();
			valorTxt.smooth = true;
			fondo = new Image(BG);
			var grafico:Graphiclist = new Graphiclist(fondo, valorTxt);
			graphic = grafico;
			layer = 1;
			fondo.centerOO();
		}
		
		public function seleccionado(col:Boolean = false):void {
			
			if (sel == true) {
				return;
			}
			
			fondo.color = col?0x31DF6D:0xFE161C;
			
			var varTween:VarTween = new VarTween();
			varTween.tween(fondo, "scale", 1.8, 0.3, Ease.backOut);
			addTween(varTween, true);
			
					
			var varTweenTxt:VarTween = new VarTween();
			varTweenTxt.tween(valorTxt, "scale", 1.8, 0.3, Ease.backOut);
			addTween(varTweenTxt, true);
			
			
			sel = true;
		}
		
		public function deSeleccionado():void {
			
			if (sel == false) {
				return;
			}
			
			fondo.color = 0xFFFFFF;
			
			var varTweenD:VarTween = new VarTween();
			varTweenD.tween(fondo, "scale", 1, 0.3, Ease.backOut);
			addTween(varTweenD, true);
			
					
			var varTweenDTxt:VarTween = new VarTween();
			varTweenDTxt.tween(valorTxt, "scale", 1, 0.3, Ease.backOut);
			addTween(varTweenDTxt, true);
			
			
			sel = false;
		}
		
		public function cambiarValor(v:uint):void {
			valor = v;
			valorTxt.text = v.toString();
			valorTxt.centerOO();
		}
	}

}