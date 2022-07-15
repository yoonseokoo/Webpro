package com.lec.ch04.ex4;

import java.util.Scanner;

import org.springframework.context.support.GenericXmlApplicationContext;

import com.lec.ch04.ex2.AdminInfo;
import com.lec.ch04.ex3.ServerInfo;

public class TestMain {
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
		ctx.load("classpath:META-INF/ex4/CTX_dev.xml", "classpath:META-INF/ex4/CTX_run.xml");
		ctx.refresh();
		envInfo info = ctx.getBean("envInfo", envInfo.class);
		System.out.println("ipNum : " + info.getIpNum());
		System.out.println("portNum : " + info.getPortNum());
		System.out.println("userId : " + info.getUserId());
		System.out.println("userPw : " + info.getUserPw());
		
	}
}

