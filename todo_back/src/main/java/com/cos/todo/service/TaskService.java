package com.cos.todo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.todo.domain.Task;
import com.cos.todo.domain.TaskRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class TaskService {

	private final TaskRepository taskRepository;
	
	@Transactional(readOnly = true)
	public List<Task> 전체목록(){
		return taskRepository.findAll();
	}
	
	@Transactional
	public Task 한건저장(Task task){
		return taskRepository.save(task);
	}
	
	@Transactional(readOnly = true)
	public Task 상세보기(long id) {
		return taskRepository.findById(id).get();
	}
	
	@Transactional
	public void 삭제하기(long id) {
		taskRepository.deleteById(id);
	}
	
	@Transactional
	public Task 수정하기(long id, Task task) {
		Task taskEntity = taskRepository.findById(id).get();
		
		if(task.getTitle() != null) {
			taskEntity.setTitle(task.getTitle());
			taskEntity.setContent(task.getContent());
		} else {
			taskEntity.setCompleted(task.isCompleted());
		}
		
		return taskEntity;
	}
	
}
