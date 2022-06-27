package com.mega.lect;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class Ex4_Listener implements ServletContextListener {
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("ch04 context 가 시작될때 (ch04 웹프로젝트가 메모리에 구동됨)");
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("ch04 context 가 종료될때 (ch04 웹프로젝트가 메모리에 구동됨)");
	}

}