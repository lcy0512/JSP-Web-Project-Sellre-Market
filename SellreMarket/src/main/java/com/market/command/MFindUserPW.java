package com.market.command;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.market.dao.FindUserInfo;

public class MFindUserPW implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 이메일을 보내는 command
		HttpSession httpSession = request.getSession();

		String smtpEmail = "jsungj3@gmail.com";
		String smtpEmailPassword = "uliauyosxkhulgmg";

		String to_email = request.getParameter("email");
		String userName = request.getParameter("name");

		Properties properties = System.getProperties();

		properties.setProperty("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.debug", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
		properties.put("mail.smtp.socketFactory.port", "587");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		// 인증 번호 생성기
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String AuthenticationKey = temp.toString();

		Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(smtpEmail, smtpEmailPassword);
			}
		});

		// email 전송
		try {
			MimeMessage msg = new MimeMessage(session);

			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

			// 메일 제목
			msg.setSubject("셀리마켓 - 비밀번호 찾기 인증번호");
			// 메일 내용
			msg.setText(userName + "님, 인증 번호는 [" + temp + "] 입니다");

			Transport transport = session.getTransport("smtp");
			transport.connect(smtpEmail, smtpEmailPassword);
			transport.sendMessage(msg, msg.getAllRecipients());
			transport.close();

			Map<String, Object> data = new HashMap<>();
			PrintWriter out = response.getWriter();

			httpSession.setAttribute("PWauthentication", AuthenticationKey);
			data.put("PWauthentication", AuthenticationKey);
			out.print(new Gson().toJson(data));
			out.flush();

		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}

	} // execute

} // End
