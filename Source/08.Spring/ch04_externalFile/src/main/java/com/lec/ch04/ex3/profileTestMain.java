package com.lec.ch04.ex3;

import java.util.Scanner;

import org.springframework.context.support.GenericXmlApplicationContext;

public class profileTestMain {
	public static void main(String[] args) {
		String config = null;
		Scanner sc = new Scanner(System.in);
		System.out.println("is it dev? or is it run?");
		String answer=sc.next();
		if(answer.equalsIgnoreCase("dev")) {
			config = "dev";
		} else if(answer.equalsIgnoreCase("run")) {
			config = "run";
		} else {
			System.out.println("Please insert a proper environment");
			System.exit(0);
		}
		sc.close();
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext();
		ctx.getEnvironment().setActiveProfiles(config);
		ctx.load("classpath:META-INF/ex3/CTX_dev.xml", "classpath:META-INF/ex3/CTX_run.xml");
		ctx.refresh();
		ServerInfo info = ctx.getBean("serverInfo", ServerInfo.class);
		System.out.println("IP : " + info.getIpNum());
		System.out.println("port : " + info.getPortNum());
	}
}
