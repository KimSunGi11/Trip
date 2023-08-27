package com.springproj.prz.exception;

import java.sql.SQLIntegrityConstraintViolationException;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

//@ControllerAdvice("com.springproj.prz")
public class CommonExceptionHandler {

	@ExceptionHandler(ArithmeticException.class)
	public ModelAndView handleArithmeticException(Exception e) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("exception", e);
		mav.setViewName("/common/arithmeticError");
		
		return mav;
	}
	
	@ExceptionHandler(NullPointerException.class)
	public ModelAndView handleNullPointerException(Exception e) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("exception", e);
		mav.setViewName("/common/nullPointerError");
		
		return mav;
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handleException(Exception e) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("exception", e);
		mav.setViewName("/common/error");
		
		return mav;
	}
	
	@ExceptionHandler(DuplicateKeyException.class)
	public ModelAndView handleDuplicateException(Exception e) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("exception", e);
		mav.setViewName("/common/Duplicateerror");
		
		return mav;
	}
}
