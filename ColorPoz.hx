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
		for ( p in doc.pages())
			for (arts in p.artboards())
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

	
	function swapcolor(l:MSLayer,inCol:String,outCol:String)
	{	
		
		var fill= l.style().fills().firstObject();
		var fillCol=fill.color();
		var alpha=fillCol.alpha();
		
		if( fillCol.hexValue().toString() == inCol){
			log( "match="+fillCol.hexValue());
			fill.setColor(MSColor.colorWithHex(outCol,alpha));
			
		}


	}
	

	static public function main()
	{
		var app = new ColorPoz();
	}
}