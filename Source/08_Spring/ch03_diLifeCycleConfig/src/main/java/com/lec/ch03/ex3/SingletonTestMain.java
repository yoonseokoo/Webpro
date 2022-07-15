package com.lec.ch03.ex3;

import org.springframework.context.support.GenericXmlApplicationContext;

import com.lec.ch03.ex1.Family;

public class SingletonTestMain {
	public static void main(String[] args) {
		
	String location = "classpath:META-INF/ex3/applicationCTX.xml";
	GenericXmlApplicationContext ctx = new GenericXmlApplicationContext(location);
	Family family1 = ctx.getBean("family", Family.class);
	Family family2 = ctx.getBean("family", Family.class);
	family1.setDadName("홍아빠2");
	family1.setMumName("홍엄마2");
	System.out.println("family1 : " + family1);
	System.out.println("family2 : " + family2);
	System.out.println("--------------------------------------------------");
	Family family3 = ctx.getBean("familyPrototype", Family.class);
	Family family4 = ctx.getBean("familyPrototype", Family.class);
	family3.setBrotherName("son");
	family3.setSisterName("daughter");
	System.out.println("family3 : " + family3);
	System.out.println("family4 : " + family4);
	System.out.println("--------------------------------------------------");
	ctx.close();
}

}