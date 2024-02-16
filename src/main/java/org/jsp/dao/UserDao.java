package org.jsp.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.jsp.dto.Todo;
import org.jsp.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	@Autowired
	private EntityManager entityManager;
	
	public User verifyUser(String username, String password) {
		String query = "select u from User u where u.username=?1 and u.password=?2";
		Query q = entityManager.createQuery(query);
		q.setParameter(1, username);
		q.setParameter(2, password);
		try {
			return (User) q.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}
	
	public User saveUser(User u) {
		EntityTransaction transaction = entityManager.getTransaction();
		entityManager.persist(u);
		transaction.begin();
		transaction.commit();
		return u;
	}
	
	public String userHtml(User u) {
		String html = "";
		for(Todo todo : u.getTodos()) {
			String singleHtml = "<li>\r\n"
					+ "        <div class=\"text "+(todo.isCpmlited()? "cross" : "")+"\">"+todo.getText()+"</div>\r\n"
					+ "        <div class=\"icons\">\r\n"
					+ "          <a href=\"mark?id="+todo.getId()+"\"\r\n"
					+ "            ><div class=\"circle\"><i class=\"fa-solid fa-check\"></i></div\r\n"
					+ "          ></a>\r\n"
					+ "          <a href=\"delete?id="+todo.getId()+"\"\r\n"
					+ "            ><div class=\"circle\"><i class=\"fa-solid fa-trash\"></i></div\r\n"
					+ "          ></a>\r\n"
					+ "        </div>\r\n"
					+ "      </li>";
			html += singleHtml;
		}
		return html;
	}
}
