package org.jsp.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.jsp.dto.Todo;
import org.jsp.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TodoDao {
	@Autowired
	private EntityManager manager;
	
	public Todo saveTodo(Todo todo, int id) {
		User u = manager.find(User.class, id);
		if(u!=null) {
			u.getTodos().add(todo);
			todo.setUser(u);
			EntityTransaction t = manager.getTransaction();
			manager.persist(todo);
			t.begin();
			t.commit();
			return todo;
		}
		return null;
	}
	public boolean deleteTodo(int id) {
		Todo todo = manager.find(Todo.class, id);
		User u = manager.find(User.class, todo.getUser().getId());
		EntityTransaction t = manager.getTransaction();
		if(todo != null) {
			u.getTodos().remove(todo);
			manager.remove(todo);
			t.begin();
			t.commit();
			return true;
		}
		return false;
	}
	public boolean markTodo(int id) {
		Todo todo = manager.find(Todo.class, id);
		EntityTransaction t = manager.getTransaction();
		if(todo != null) {
			todo.setCpmlited(true);
			t.begin();
			t.commit();
			return true;
		}
		return false;
	}
}
