package com.lec.ch13.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.lec.ch13.service.FileUploadService;

@Controller
public class FileController {
	@Autowired
	private FileUploadService fService;
	@RequestMapping(value="fileInput", method = RequestMethod.GET)
	public String fileInput() {
		return "fileInput";
	}
	@RequestMapping(value="fileupload", method = RequestMethod.POST)
	public ModelAndView fileupload(MultipartHttpServletRequest mRequest, ModelAndView mav) {
		if(fService.fileUp(mRequest, mav)) {
			mav.addObject("fileResult", "file upload Successful");
		} else {
			mav.addObject("fileResult", "file upload unsuccessful");
		}
		mav.setViewName("fileResult");
		return mav;
	}
}
