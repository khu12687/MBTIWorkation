package kr.ac.kopo.aspects;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.ac.kopo.model.Member;

@Aspect
@Component
public class LogAspect {
	
	@Autowired
	LogService service;
	
	@AfterReturning(pointcut = "@annotation(PointcutLogin) && args(member)", returning = "result")
	public void LogLogin(JoinPoint joinPoint, Member member, boolean result) { //LogLogin 어드바이스 ->프록시
		System.out.println("LOGIN : "+member.getId() + "-> "+result + joinPoint);
		
		service.login(member, result);
	}
	
	
}
