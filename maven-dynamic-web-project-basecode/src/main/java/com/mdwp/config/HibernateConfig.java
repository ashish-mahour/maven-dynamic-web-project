package com.mdwp.config;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
@Configuration
@EnableTransactionManagement
@ComponentScan({"com.mdwp"})
@PropertySource(value = {"classpath:application.properties"})
public class HibernateConfig {
	@Autowired
	Environment e;
	
	@Bean
	public DataSource getDataSource() {
		DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
		driverManagerDataSource.setDriverClassName(e.getRequiredProperty("jdbc.driverClassName"));
		driverManagerDataSource.setUrl(e.getRequiredProperty("jdbc.url"));
		driverManagerDataSource.setUsername(e.getRequiredProperty("jdbc.username"));
		driverManagerDataSource.setPassword(e.getRequiredProperty("jdbc.password"));
		return driverManagerDataSource;
	}
	
	private Properties getProperties() {
		Properties properties = new Properties();
		properties.setProperty("hibernate.dialect",e.getRequiredProperty("hibernate.dialect"));
		properties.setProperty("hibernate.show_sql",e.getRequiredProperty("hibernate.show_sql"));
		properties.setProperty("hibernate.format_sql",e.getRequiredProperty("hibernate.format_sql"));
		properties.setProperty("hibernate.hbm2ddl.auto",e.getRequiredProperty("hibernate.hbm2ddl.auto"));
		return properties;
	}
	
	@Bean
	public LocalSessionFactoryBean getSession() {
		LocalSessionFactoryBean localSessionFactoryBean = new LocalSessionFactoryBean();
		localSessionFactoryBean.setDataSource(getDataSource());
		localSessionFactoryBean.setHibernateProperties(getProperties());
		localSessionFactoryBean.setPackagesToScan("com.mdwp.dao.entity");
		return localSessionFactoryBean;
	}
	
	@Bean
	@Autowired
	public HibernateTransactionManager getTransaction(SessionFactory s) {
		HibernateTransactionManager hibernateTransactionManager = new HibernateTransactionManager();
		hibernateTransactionManager.setSessionFactory(s);
		return hibernateTransactionManager;
	}

}
