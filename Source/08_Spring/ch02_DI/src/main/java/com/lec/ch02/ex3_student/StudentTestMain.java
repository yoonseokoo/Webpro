package com.lec.ch02.ex3_student;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
public class StudentTestMain {
	public static void main(String[] args) {
		String configLocation = "classpath:applicationCTX3.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation); // 파싱
		StudentInfo studentInfo = ctx.getBean("studentInfo", StudentInfo.class); // 컴포넌트 가져온다
		studentInfo.getInfo();
		Student student1 = ctx.getBean("student1", Student.class); // 컴포넌트 가져온다
		if(student1.equals(studentInfo.getStudent())) {
			System.out.println("두 객체는 같다");
		}
		Student student2 = ctx.getBean("student2", Student.class);
		studentInfo.setStudent(student2);
		studentInfo.getInfo();
		ctx.close();
	}//main
}
