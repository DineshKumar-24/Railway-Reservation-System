package com.railway;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
public class RailwayReservationSystemApplication {
	private static final Logger logger = LogManager.getLogger(RailwayReservationSystemApplication.class);
	public static void main(String[] args) {
		logger.info("Entering Application...");
		SpringApplication.run(RailwayReservationSystemApplication.class, args);
	
	}
	
}
