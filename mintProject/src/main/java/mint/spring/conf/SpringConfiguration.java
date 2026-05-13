package mint.spring.conf;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

@Configuration
public class SpringConfiguration {
	@Bean(name="dataSource")
	public BasicDataSource getBasicDataSource() {
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(getEnv("MINT_DB_DRIVER", "oracle.jdbc.OracleDriver"));
		basicDataSource.setUrl(requiredEnv("MINT_DB_URL"));
		basicDataSource.setUsername(requiredEnv("MINT_DB_USERNAME"));
		basicDataSource.setPassword(requiredEnv("MINT_DB_PASSWORD"));
		basicDataSource.setMaxTotal(20);
		basicDataSource.setMaxIdle(3);
		return basicDataSource;
	}
	
	@Bean(name="sqlSessionFactory")
	public SqlSessionFactory getSqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(getBasicDataSource());
	//	sqlSessionFactoryBean.setConfigLocation(new ClassPathResource("spring/mybatis-config.xml"));
												//패턴을 매칭해주는 클래스. 자원(xml; resource)의 값을 얻어온다.   //classpath: 없어도 되네 ?
		sqlSessionFactoryBean.setConfigLocation(new PathMatchingResourcePatternResolver().getResource("classpath:spring/mybatis-config.xml"));
		sqlSessionFactoryBean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:mint/*/dao/*Mapper.xml")); 
	
		return sqlSessionFactoryBean.getObject(); //sqlSessionFactory object를 리턴. 
	}
	
	@Bean(name="sqlSession")
	public SqlSessionTemplate getsqlSessionTemplate() throws Exception {
		return new SqlSessionTemplate(getSqlSessionFactory()); 
	}
	
	@Bean(name="transactionManager")
	public DataSourceTransactionManager getDataSourceTransactionManager() {
		DataSourceTransactionManager dataSourceTransactionManager = new DataSourceTransactionManager();
		dataSourceTransactionManager.setDataSource(getBasicDataSource());
		return dataSourceTransactionManager;		
	}

	private String requiredEnv(String name) {
		String value = System.getenv(name);
		if(value == null || value.trim().isEmpty()) {
			throw new IllegalStateException("Missing required environment variable: " + name);
		}
		return value;
	}

	private String getEnv(String name, String defaultValue) {
		String value = System.getenv(name);
		return value == null || value.trim().isEmpty() ? defaultValue : value;
	}
}
