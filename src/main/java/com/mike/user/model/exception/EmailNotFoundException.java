package com.mike.user.model.exception;

public class EmailNotFoundException extends RuntimeException{
	
	public EmailNotFoundException() {
		super();
	}
	
    public EmailNotFoundException(String message) {
        super(message);
    }
}
