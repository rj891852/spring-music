package org.cloudfoundry.samples.music.config.data;

import com.mongodb.MongoClient;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.data.mongodb.MongoDbFactory;
import org.springframework.data.mongodb.core.SimpleMongoDbFactory;

@Configuration
@Profile("mongodb-local")
public class MongoLocalConfig {
	private static final Log logger = LogFactory.getLog(MongoLocalConfig.class);
	
    @Bean
    public MongoDbFactory mongoDbFactory() {
    	logger.debug("MONGO LOCAL");
        return new SimpleMongoDbFactory(new MongoClient(), "music");
    }

}
