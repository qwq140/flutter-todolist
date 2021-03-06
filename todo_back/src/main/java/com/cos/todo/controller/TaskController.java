package com.cos.todo.controller;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.todo.controller.dto.CMRespDto;
import com.cos.todo.domain.Task;
import com.cos.todo.service.TaskService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class TaskController {

	private final TaskService taskService;
	
	@GetMapping("/todo")
	public CMRespDto<?> findAll(){
		return new CMRespDto<>(1,"전체목록 성공",taskService.전체목록());
	}
	
	@GetMapping("/todo/{id}")
	public CMRespDto<?> findById(@PathVariable long id){
		return new CMRespDto<>(1,"상세보기 성공",taskService.상세보기(id));
	}
	
	@PostMapping("/todo")
	public CMRespDto<?> save(@RequestBody Task task){
		return new CMRespDto<>(1,"저장 성공",taskService.한건저장(task));
	}
	
	@DeleteMapping("/todo/{id}")
	public CMRespDto<?> delete(@PathVariable long id){
		taskService.삭제하기(id);
		return new CMRespDto<>(1,"삭제 성공",null);
	}
	
	@PutMapping("/todo/{id}")
	public CMRespDto<?> update(@PathVariable long id,@RequestBody Task task){
		return new CMRespDto<>(1,"수정 성공",taskService.수정하기(id, task));
	}
	
}
