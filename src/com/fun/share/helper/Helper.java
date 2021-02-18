package com.fun.share.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {

	public static boolean deleteFile(String path)
	{
		boolean f=false;
		try {
			
			File file=new File(path);
			f = file.delete();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public static boolean saveFile(InputStream is,String path){
		boolean f=false;
		try {
			
			//create a byte array
			byte b[]=new byte[is.available()];
			
			//read data from is and store it in byte array b
			is.read(b);
			
			//to write file create object of FOS
			FileOutputStream fos=new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			f=true;
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
}
