package com.mike.tool;

public class StringProcessor {

	public static String getFileExtension(String filename) throws IllegalArgumentException{
		
		String fileExtension;
		
		int dotIndex = filename.lastIndexOf('.');
		if (!(dotIndex == -1)) {
		  fileExtension = filename.substring(dotIndex + 1);
		} else {
		  throw new IllegalArgumentException("input filename lack of extension(.)");
		}
		
		return fileExtension; //"jpg" without "."
	}
	
	public static String getFilename(String path) throws IllegalArgumentException{
		
		String filename;
		
		int dotIndex = path.lastIndexOf('/');
		if (!(dotIndex == -1)) {
		  filename = path.substring(dotIndex + 1);
		} else {
		  throw new IllegalArgumentException("input path lack of \"/\"");
		}
		
		return filename; //"dog.jpg"
	}

}
