package com.lec.ch03.ex2;

import org.springframework.context.support.GenericXmlApplicationContext;

public class TestMain {
	public static void main(String[] args) {
		// Constructing IOC container (environment setting)
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext();
		ctx.load("classpath:META-INF/ex2/applicationCTX.xml");
		ctx.refresh();
		System.out.println("-----------------------------------------------");
		Person person = ctx.getBean("person", Person.class);
		System.out.println(person);
		OtherPerson otherPerson = (OtherPerson)ctx.getBean("otherPerson");
		System.out.println(otherPerson);
		System.out.println("-----------------------------------------------");
		ctx.close();
		System.out.println("bean end");
	}
}
