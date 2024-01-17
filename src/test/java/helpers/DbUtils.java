package helpers;

import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class DbUtils {
    
    private static final Logger logger = LoggerFactory.getLogger(DbUtils.class); 
    
    private final JdbcTemplate jdbcTemplate;

    public DbUtils(Map<String, Object> config) {
        String url = (String) config.get("url");
        String username = (String) config.get("user");
        String password = (String) config.get("password");
        String driver = (String) config.get("driverClassName");
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(driver);
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        jdbcTemplate = new JdbcTemplate(dataSource);
        logger.info("init jdbc template: {}", url);
    }
    
    public Object readValue(String query) {
        return jdbcTemplate.queryForObject(query, Object.class);
    }    
    
    public Map<String, Object> readRow(String query) {
        return jdbcTemplate.queryForMap(query);
    }
    
    public List<Map<String, Object>> readRows(String query) {
        return jdbcTemplate.queryForList(query);
    }         
}