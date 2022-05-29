package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import java.util.Date;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.net.InetAddress;
import java.net.UnknownHostException;

@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

}
@RestController
class HelloRestController {
	private static final Logger logger = LoggerFactory.getLogger(HelloRestController.class);
	@RequestMapping("/hello/{name}")
	public String helloDocker(@PathVariable(value = "name") String name) throws UnknownHostException {
		String hostname = InetAddress.getLocalHost().getHostName();

		String response = "Hai " + name + " Response received on : " + new Date() + " My Hostname : " + hostname;
		logger.info("Response :: {}", response);
		return response;

	}
}
