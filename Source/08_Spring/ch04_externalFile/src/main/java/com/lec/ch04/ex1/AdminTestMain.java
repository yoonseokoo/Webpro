package com.lec.ch04.ex1;

import java.io.IOException;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.io.support.ResourcePropertySource;

public class AdminTestMain {
	public static void main(String[] args) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext(); //construct container
		ConfigurableEnvironment env = ctx.getEnvironment();
		MutablePropertySources propertySources = env.getPropertySources(); //set features and its values on env
		try {
			String location = "classpath:META-INF/ex1/admin.properties";
			propertySources.addLast(new ResourcePropertySource(location));
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		System.out.println("admin.id = " + env.getProperty("admin.id"));
		System.out.println("admin.pw = " + env.getProperty("admin.pw"));
		//Once adding setting features on env, create bean
		ctx.load("classpath:META-INF/ex1/applicationCTX.xml");
		ctx.refresh();
		Admin admin = ctx.getBean("admin", Admin.class);
		System.out.println("adminId : " + admin.getAdminId());
		System.out.println("adminPw : " + admin.getAdminPw());
		ctx.close();
	}
}
