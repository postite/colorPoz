	class CopyPlug
	{

	static public function main()
	{

	var t = sys.io.File.getContent( "colorPoz/out/colorPoz.jstalk" );
		var f= new StringBuf();
		f.add("// ColorPoz (ctrl alt command c) \n");
		f.add(t);
		sys.io.File.saveContent("colorPoz/out/colorPoz.jstalk" ,f.toString());
		sys.io.File.saveContent("/Users/ut/Library/Application Support/sketch/Plugins/colorPoz/colorPoz.jstalk" ,f.toString());
		//sys.io.File.copy("./out/testApi.jstalk", "/Users/ut/Library/Application Support/sketch/Plugins/TestApi/testApi.jstalk" );
		
		
	}

}