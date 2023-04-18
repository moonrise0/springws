//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.kbstar.frame;

import java.io.PrintStream;
import java.util.Date;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class LoggerAdvice {
    public LoggerAdvice() {
    }

    @Before("execution(* com.kbstar.service.*Service.*(..))")
    public void beforeLog(JoinPoint jp) {
        Object[] arg = jp.getArgs();
        Signature si = jp.getSignature();
        Date d = new Date();
        PrintStream var10000 = System.out;
        String var10001 = d.toString();
        var10000.println(var10001 + " Before Log:" + si.getName());
    }

    @After("execution(* com.kbstar.service.*Service.*(..))")
    public void afterLog(JoinPoint jp) {
        Signature si = jp.getSignature();
        System.out.println("-----------After Log:" + si.getName());
    }

    @Around("execution(* com.*.*.*Service.*(..))")
    public Object around(ProceedingJoinPoint process) {
        Object result = null;
        Signature si = process.getSignature();
        String className = process.getTarget().toString();
        long start = System.currentTimeMillis();
        PrintStream var10000 = System.out;
        String var10001 = si.getName();
        var10000.println("***Before:" + var10001 + " " + className);

        try {
            result = process.proceed();
        } catch (Throwable var9) {
            var9.printStackTrace();
        }

        long end = System.currentTimeMillis();
        var10000 = System.out;
        var10001 = si.getName();
        var10000.println(var10001 + " 시간 " + (end - start) + "ms");
        var10000 = System.out;
        var10001 = si.getName();
        var10000.println("***After:" + var10001 + " " + className);
        return result;
    }
}
