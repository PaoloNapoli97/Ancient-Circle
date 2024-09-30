
package com.toSoftware.Ancient.Circle;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.toSoftware.Ancient.Circle.dao.DaoCalcolatore;
import com.toSoftware.Ancient.Circle.dao.DaoUtente;
import com.toSoftware.Ancient.Circle.dao.Database;

@Configuration
public class Context
{
	@Bean
	public Database db()
	{
		return new Database("ancientcircle");
	}
	
	@Bean
	public DaoUtente daoUtente()
	{
		return new DaoUtente();
	}
	@Bean 
	public DaoCalcolatore daoCalcolatore()
	{
		return new DaoCalcolatore();
	}

}
