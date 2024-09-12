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
	private String password; // ���Ŀ� properties���Ϸ� �����Ͽ� git�� �ø��� �ʱ�
	
	public void sendMail(String emailAddr, String activationCode) throws AddressException, MessagingException, IOException {
		String subject = "miniproject.com���� ������ ȸ������ �̸��� ������ȣ �Դϴ�.";
		String message = "ȸ�������� ȯ���մϴ�.. \n ������ȣ : " + activationCode + "�� �Է��Ͻð� ȸ�������� �Ϸ��ϼ���.";
	
		// naver �̸��ϼ����� ���� ȯ�� ����
		// Properties��ü : �θ� Map, key�� value�� �����͸� ����, ���Ϸ� �����ϰų� �о�� �� �ִ�
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.naver.com");  // smtp ȣ��Ʈ �ּ� ���
		props.put("mail.smtp.port", "465"); // naver smtp�� ��Ʈ��ȣ
		props.put("mail.smtp.starttls.required", "true"); // ����� ������ ���� ����
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		props.put("mail.smtp.ssl.enable", "true");  // SSL ���	
		props.put("mail.smtp.auth", "true"); // ���� ������ ��ġ�ڴ�.
		getAccount();
		Session mailSession = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		}); // ����� ������� �� 
		System.out.println(mailSession.toString());
		if(mailSession!=null) {
			MimeMessage mime = new MimeMessage(mailSession);
			mime.setFrom(new InternetAddress("miseol93@naver.com")); // �����»�� �����ּ�
			mime.addRecipient(RecipientType.TO, new InternetAddress(emailAddr));
			// ���� ����� ��������
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
		account.load(new FileReader("D:\\Project\\TKLibraryStore\\src\\main\\resources\\mailpop.properties"));
		this.username = (String)account.get("username");
		this.password = (String)account.get("password");
	}
}
