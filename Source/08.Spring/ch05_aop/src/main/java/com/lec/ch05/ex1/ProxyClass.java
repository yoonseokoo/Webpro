package com.lec.ch05.ex1;

import org.aspectj.lang.ProceedingJoinPoint;

public class ProxyClass {
	
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
	//Before Advice
		public void beforeAdvice() {
			System.out.println("핵심기능 수행하고 알아서 beforeAdvice(공통기능) 수행");
		}
	//After Advice
		public void afterAdvice() {
			System.out.println("공통기능 수행하고 알아서 afterAdvice(핵심기능) 수행");
		}
	//After-returning Advice
		public void afterReturningAdvice() {
			System.out.println("정상적으로 (예외발생되지 않고) 핵심기능 수행된 후 공통가능 수행");
		}
	//After-throwing Advice
		public void afterThrowingAdvice() {
			System.out.println("예외가 발생된 핵심기능이 수행된 후 afterThrowingAdvice 수행");
		}
}
