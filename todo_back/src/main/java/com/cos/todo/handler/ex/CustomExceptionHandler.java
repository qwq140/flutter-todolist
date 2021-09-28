package com.cos.todo.handler.ex;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

import com.cos.todo.controller.dto.CMRespDto;

@RestController
@ControllerAdvice
public class CustomExceptionHandler {

	@ExceptionHandler(CustomApiException.class) // RuntimeException이 발동하는 모든 익셉션을 가로챈다.
	public CMRespDto<?> apiException(CustomApiException e) {
		return new CMRespDto<>(-1, "오류발생", null);
	}
	
}