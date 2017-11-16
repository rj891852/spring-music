package org.cloudfoundry.samples.music.config.data;

import org.springframework.cloud.config.java.AbstractCloudConfig;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import javax.sql.DataSource;

// FAB added for pooling
import org.springframework.cloud.service.relational.DataSourceConfig;
import org.springframework.cloud.service.PooledServiceConnectorConfig.PoolConfig;

@Configuration
@Profile({"mysql-cloud", "postgres-cloud", "oracle-cloud", "sqlserver-cloud"})
public class RelationalCloudDataSourceConfig extends AbstractCloudConfig {

    @Bean
    public DataSource dataSource() {

	// FAB put in for pooling (min=5,max=30,wait=3000)
	PoolConfig poolConfig = new PoolConfig(5, 30, 3000);
	DataSourceConfig dbConfig = new DataSourceConfig(poolConfig, null);

        return connectionFactory().dataSource(dbConfig);
    }

}
