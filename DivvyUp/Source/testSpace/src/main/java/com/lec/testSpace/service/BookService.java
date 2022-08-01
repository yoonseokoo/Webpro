package com.lec.testSpace.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.testSpace.dto.Book;
public interface BookService {
	public List<Book> mainList();
	public List<Book> bookList(String pageNum, Book book);
	public int totCntBook(Book book);
	public Book getDetailBook(int bnum);
	public int registerBook(MultipartHttpServletRequest mRequest, Book book);
	public int registerBook(MultipartHttpServletRequest mRequest);
	public int modifyBook(MultipartHttpServletRequest mRequest, Book book);
}
