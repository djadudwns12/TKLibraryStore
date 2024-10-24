package com.tn.member.service;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;

public class SendMailService {
	@Autowired
	ResourceLoader resourceLoader;
	
	private String username;
	private String password; 
	
	public void sendMail(String emailAddr, String activationCode) throws AddressException, MessagingException, IOException {
		String subject = "떡잎서점 회원정보수정 서비스 :: 이메일 인증을 완료해주세요.";
		String message = "입력창에 인증코드를 입력해주세요 \n인증코드: " + activationCode + "\n 감사합니다.";
	
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.naver.com");  
		props.put("mail.smtp.port", "465"); 
		props.put("mail.smtp.starttls.required", "true"); 
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		props.put("mail.smtp.ssl.enable", "true");  
		props.put("mail.smtp.auth", "true"); 
		getAccount();
		Session mailSession = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		}); 
		// System.out.println(mailSession.toString());
		if(mailSession!=null) {
			MimeMessage mime = new MimeMessage(mailSession);
			mime.setFrom(new InternetAddress("miseol93@naver.com")); 
			mime.addRecipient(RecipientType.TO, new InternetAddress(emailAddr));
			mime.setSubject(subject);
			mime.setText(message);
			
			Transport trans = mailSession.getTransport("smtp");
			trans.connect(username, password);
			trans.send(mime);
			trans.close();
		}
	}	
	
	private void getAccount() throws IOException {
		Properties account = new Properties();
		account.load(new FileReader("D:\\java_pro\\lecture\\Workspace\\tnbookstore\\src\\main\\resources\\mailpop.properties"));
		this.username = (String)account.get("username");
		this.password = (String)account.get("password");
	}
}
