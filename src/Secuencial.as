package 
{
	import Entidades.Cuadro;
	import Entidades.Estatus;
	import Entidades.Flecha;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.motion.LinearMotion;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author @SAldrin
	 */
	
	public class Secuencial extends World 
	{
		private var cuadros:Vector.<Cuadro>;
		private var flecha:Flecha;
		private var lista:Vector.<Cuadro>;
		private var indice:uint;
		private var buscar:int = 0;
		private var status:Estatus;
		private var estado:uint = 0;
		
		public function Secuencial() 
		{
			cuadros = new Vector.<Cuadro>();
			indice = 0;
			flecha = new Flecha(-100, -100);
			add(flecha);
			
			var pad:uint = 30;
			var cnt:uint = 0;
			
			for (var i:uint = 0; i < 8; i++) {
				for (var j:uint = 0; j < 13; j++) {
					var tmp:Cuadro = new Cuadro((j * 70) + 2 * pad, (i * 70) + 2*pad, cnt);
					add(tmp);
					cuadros.push(tmp);
					cnt++;
				}
			}
			
			status = new Estatus(10, 580);
			add(status);
			add(new Entity(740, 775, new Text("Aldrin Salazar @ AlphaSigma.web.ve",0,0,{font: "aldrin"})));
			
			inicio();
		}
		
		override public function update():void {
			super.update();	
			
			if (Input.pressed(Key.SPACE)) {
				if (estado == 0) {	
					estado = 2;
					status.y += 25;
					iterar();
				}else if (estado == 1) {
					cuadros[indice-1].deSeleccionado();
					inicio();
					var t:LinearMotion = new LinearMotion();
					t.setMotion(flecha.x, flecha.y, -100, -100, 0.5, Ease.backOut);
					t.object = flecha;
					addTween(t, true);
					indice = 0;
					estado = 0;
				}else if (estado == 2) {
					estado = 1;
				}
			}
			
			if(estado == 0) {
				if (Input.pressed(Key.RIGHT)) {
					buscar++;
					inicio();
				}
				
				if (Input.pressed(Key.LEFT)) {
					buscar--;
					inicio();
				}
				
				if (Input.pressed(Key.UP)) {
					buscar += 100;
					inicio();
				}
				
				if (Input.pressed(Key.DOWN)) {
					buscar -= 100;
					inicio();
				}
				
				if (Input.mouseWheel) {
					if (Input.mouseWheelDelta > 0) {
						buscar += 10;
					}else {
						buscar -= 10;
					}
					
					inicio();
				}
				
				if (Input.pressed(Key.R)) {
					random();
				}
				
				if (Input.pressed(Key.M)) {
					FP.world = new Transition(Menu);
				}
				
			}
		}
		
		private function randomRange(minNum:Number, maxNum:Number):Number 
		{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
		
		private function random():void {
			for (var i:uint = 0; i < cuadros.length; i++) {
				cuadros[i].cambiarValor(randomRange(0, 999));
			}
		}
		
		private function inicio():void {
			status.setText("Presiona espacio para iniciar busqueda del numero "+buscar+".");
		}
		
		private function noEncontrado():void {
			status.setText("Elemento "+buscar+" no se encontro. "+indice+" ciclos recorridos.");
		}
		
		private function iterar():void {
			
			if (indice >= cuadros.length) {
				noEncontrado();
				return;
			}else {
				var c:Cuadro = cuadros[indice];	
			}
			
			if (indice > 0) {
				cuadros[indice-1].deSeleccionado();
			}
			
			var fin:Function;
			
			if (indice > cuadros.length || c.valor == buscar) {
				fin = theEnd;
			}else {
				fin = iterar;
			}
			
			status.setText("Buscando el elemento "+buscar+"\n"+(indice+1)+" ciclos recorridos");
			
			var t:LinearMotion = new LinearMotion(fin);
			c.seleccionado();
			t.setMotion(flecha.x, flecha.y, c.x - 30, c.y - 130, 0.5, Ease.backOut);
			t.object = flecha;
			addTween(t, true);
			indice++;
		}
		
		private function theEnd():void {
			status.y = 580;
			status.setText("Encontrado el elemento " + buscar + ", en " + (indice) + " ciclo/s. Posicion: " + (indice-1));
			estado = 1;
		}
		
	}

}