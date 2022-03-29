package pkg1;

public aspect TraceAspectPamoori {
	
	pointcut classToTrace(): within(*App);
	
	pointcut methodToTrace(): classToTrace() && execution(String getName()) ;
	
	before(): methodToTrace() {
		
	      String info = thisJoinPointStaticPart.getSignature() + ", " ;
		  int line = thisJoinPointStaticPart.getSourceLocation().getLine();
	      System.out.println("[BGN] " + info + line);
	      
	   }

	after(): methodToTrace() {
		
		String fileName = thisJoinPointStaticPart.getSourceLocation().getFileName();//
	    System.out.println("[ENG] " + fileName);
	   }
	
}
