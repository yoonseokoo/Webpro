package com.lec.ch05.ex2;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
@Aspect

public class ProxyClass2 {
	
	/*
	 * @Pointcut("within(com.lec.ch05.ex2.*)") private void aroundM() {}
	 * 
	 * @Around("aroundM()")
	 */
	@Around("within(com.lec.ch05.ex2.*)")
	
	//Around Advice
		public Object aroundAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
			System.out.println("◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆");
			String signitureName = joinPoint.getSignature().toString();
			System.out.println(signitureName + " has started");
			long startTime = System.currentTimeMillis();
			Object obj;
			try {
				obj = joinPoint.proceed();
				return obj;
			} finally {
				long endTime = System.currentTimeMillis();
				System.out.println(signitureName + "가 수행되는 경과 시간 : " + (endTime-startTime));
			}
		}
	
	@Before("execution(* com.lec.ch05.ex2.Student2.*())")
	//Before Advice
		public void beforeAdvice() {
			System.out.println("핵심기능 수행하기 전에 알아서 beforeAdvice(공통기능) 수행");
		}
	
	@After("bean(stud*)")
	//After Advice
		public void afterAdvice() {
			System.out.println("공통기능 수행하고 알아서 afterAdvice(핵심기능) 수행");
		}
	
	@AfterReturning("within(com.lec.ch05.ex2.Worker2)")
	//After-returning Advice
		public void afterReturningAdvice() {
			System.out.println("정상적으로 (예외발생되지 않고) 핵심기능 수행된 후 공통가능 수행");
		}
	@AfterThrowing("execution(void com.lec.ch05.ex2.Student2.*())")
	//After-throwing Advice
		public void afterThrowingAdvice() {
			System.out.println("예외가 발생된 핵심기능이 수행된 후 afterThrowingAdvice 수행");
		}
}
