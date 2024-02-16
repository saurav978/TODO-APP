package org.jsp;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = "org.jsp")
public class TodoConfig {
	@Bean
	public EntityManager getEntityManagerFactory() {
		return Persistence.createEntityManagerFactory("dev").createEntityManager();
	}
}
