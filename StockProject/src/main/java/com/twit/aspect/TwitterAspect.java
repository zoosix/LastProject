package com.twit.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import com.twit.main.MyTwitterStream;
@Aspect
public class TwitterAspect {
   @Autowired
   private MyTwitterStream ms;
   @Before("execution(* com.sist.finalbigdata.TwitController.init(..))")
   public void start()
   {
	   ms.twitterStart();
   }
}
