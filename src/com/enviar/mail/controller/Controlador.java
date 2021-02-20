package com.enviar.mail.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("principal")
public class Controlador {
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String iniciar() {
		return "index";
	}
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="/index", method = RequestMethod.POST)
	public String doSendEmail(HttpServletRequest request) {
		
		String recipientAddress = request.getParameter("recipient");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");		
	
		
		// imprime debug info
		System.out.println("To: " + recipientAddress);
		System.out.println("Subject: " + subject);
		System.out.println("Message: " + message);
		
		// creates a simple e-mail object
		SimpleMailMessage email = new SimpleMailMessage();
		email.setTo(recipientAddress);
		email.setSubject(subject);
		email.setText(message);
		
		// envia mail
		mailSender.send(email);
		
		// regresa success si es correcto el envio
		return "Succes";
	}
}
