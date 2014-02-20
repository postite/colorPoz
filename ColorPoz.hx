import Global.*;
using helpers.Document;
using helpers.Artboard;
using helpers.StringSketch;
using helpers.Layer;
import helpers.UI;
class ColorPoz
{
	var hexSelected:String;
	var hex:String;
	function new()
	{
		log("ColorPoz");
		try
		 hexSelected=selection.firstObject().style().fills().firstObject().color().hexValue()
		catch (message:Dynamic)
		return UI.alert("please select a colored object");
		 hex=doc.askForUserInput("replace all #"+hexSelected+ "width:",0,"cc3300");
		 log( hex);
		 for (arts in doc.artboards())
		 	for (layer in arts.layers()){
		 		loop(layer);
		 	}

		log("done");
	}
	function loop(layer:MSLayer)
	{	if(!layer.isGroup())return swapcolor(layer,hexSelected,hex);
		for ( l in layer.layers())
			loop( l);
	}

	// function testColor()
	// {
	// 	for (l in selection){
	// 		if( !l.isGroup())
	// 		changecolor(l);

	// 	}
	// }
	function swapcolor(l:MSLayer,inCol:String,outCol:String)
	{	
		
		var fill= l.style().fills().firstObject();
		var fillCol=fill.color();
		//log(fill.hexValue());
		//log("inCol="+inCol + "fillhex="+fillCol.hexValue());

		//if( Std.string(fillCol.hexValue()) == Std.string(inCol)){
		if( fillCol.hexValue().toString() == inCol){
			log( "match="+fillCol.hexValue());
			fill.setColor(MSColor.colorWithHex(outCol));
		}


	}
	// function changecolor(l:MSLayer)
	// {
	// 	var fillp=l.style().fills().firstObject();
	// 	var color:MSColor= cast fillp.color();
	// 	var hex =color.hexValue();
	// 	//var col=MSColor.colorWithHex("cc3300");
	// 	//var col =MSColor.colorWithNSColor(generateColor());
	// 	//var col =MSColor.colorWithHue(0.2,0.3,0.4,1);
	// 	//var col=MSColor.colorWithHex(hex);
	// 	var br=color.brightness();
	// 	var hue=color.hue();
	// 	var sat=color.saturation();

	// 	var col =MSColor.colorWithHue(hue,sat,Math.random()*.9);
	// 	log(MSColor.screenColorSpace());
		
		
	// 	untyped fillp.setColor(col);
	// 	//col.set();

	// 	//untyped fill.setFill(col);
	// }

	// function generateColor():NSColor
	// {
	// 	 return  untyped __js__('[NSColor colorWithCalibratedWhite:.82 alpha:1.0]');
	// }
	// function hue()
	// {
	// 	//return untyped __js__('var color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1]');

	// }

	static public function main()
{
		var app = new ColorPoz();
	}
}