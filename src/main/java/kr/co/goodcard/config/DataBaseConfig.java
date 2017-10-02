package kr.co.goodcard.config;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

@Configuration
@MapperScan("kr.co.goodcard.dao")
@EnableTransactionManagement
public class DataBaseConfig implements TransactionManagementConfigurer {
	
/*	private static String DRIVER_NAME = "oracle.jdbc.driver.OracleDriver";
	private static String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static String USERNAME = "goodcard";
	private static String PASSWORD = "goodcard";*/
	
	private static String DRIVER_NAME = "com.mysql.jdbc.Driver";
	private static String URL = "jdbc:mysql://13.125.9.203:3306/hana?useUnicode=true&characterEncoding=utf8";
	private static String USERNAME = "goodcard";
	private static String PASSWORD = "goodcard";

	// DataSource Bean 등록 -> xml에서 빈 등록 하던 것과 같음
	@Bean
	public DataSource dataSource(){
		BasicDataSource dataSource = new BasicDataSource();
	    dataSource.setDriverClassName(DRIVER_NAME);
	    dataSource.setUrl(URL);
	    dataSource.setUsername(USERNAME);
	    dataSource.setPassword(PASSWORD);
	    return dataSource;
	}

	// SqlSessionFactory Bean 등록 -> xml에서 빈 등록 하던것과 같음
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);

		Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:config/sqlmap/mysql/*.xml");
		sessionFactory.setMapperLocations(res);
		sessionFactory.setTypeAliasesPackage("kr.co.goodcard.vo");
		return sessionFactory.getObject();
	}
	
	@Bean
	public PlatformTransactionManager transactionManager(){
		return new DataSourceTransactionManager(dataSource());
	}

	public PlatformTransactionManager annotationDrivenTransactionManager() {
		return transactionManager();
	}

}
