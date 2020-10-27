package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestClient {

	@GetMapping(path = "/")
	public String upAndRunning() {
		return "Application is up and runing";
	}
	
	@GetMapping(path = "/hello-world")
	public String helloWorld() {
		
		return "Hello World !!";
	}
	
}
