package com.lec.ch13.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Service
public class FileUploadService {
	public boolean fileUp(MultipartHttpServletRequest mRequest, ModelAndView mav) {
		boolean isUpload = false;
		//receive the uploaded file name, upload on server and copy to porject folder
		String uploadPath = mRequest.getRealPath("upload/");
		String backupPath = "C:/Users/user/Desktop/unie/Source/08_Spring/ch13_fileup/src/main/webapp/upload/";
		String [] filenames = new String[3];
		int i=0;
		Iterator<String> params = mRequest.getFileNames(); //file1, fiel2, file3
		while(params.hasNext()){
			String param = params.next();
			System.out.println(i+"번째 파라미터 이름 : " + param);
			MultipartFile mFile=mRequest.getFile(param);
			filenames[i] = mFile.getOriginalFilename(); //original file name that user has uploaded to param
			if(filenames[i] != null && !filenames[i].equals("")) {
				if (new File(uploadPath + filenames[i]).exists()) {
					filenames[i] = System.currentTimeMillis() + filenames[i];
				}
				try {
					mFile.transferTo(new File(uploadPath + filenames[i]));
					System.out.println("File saved on server : " + uploadPath + filenames[i]);
					System.out.println("copied backup file : " + backupPath + filenames[i]);
					isUpload = filecopy(uploadPath + filenames[i], backupPath + filenames[i]);
				} catch (IOException e) {
					System.out.println(e.getMessage());
				} 
			}
			i++;
		}
		mav.addObject("filenames", filenames);
		return isUpload;
	}
	private boolean filecopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		InputStream is = null; 
		OutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}
}
