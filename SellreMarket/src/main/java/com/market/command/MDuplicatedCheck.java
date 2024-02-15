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
import com.market.dao.SignUpDao;

public class MDuplicatedCheck implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		boolean result;
		String userid = null;
		
		
		try {
			userid = request.getParameter("userid");
		}catch(Exception e) {
			e.printStackTrace();
			return;
		}
		
		if(userid != null) {
			SignUpDao dao = new SignUpDao();
			result = dao.checkDuplicatedId(userid);
			
			try {
				PrintWriter out = response.getWriter();
				out.print(new Gson().toJson(result));
				out.flush();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return;
		}
		
		// email
		String email = null;
		try {
			email = request.getParameter("email");
		}catch(Exception e) {
			e.printStackTrace();
			return;
		}
		
		if(email != null) {
			SignUpDao dao = new SignUpDao();
			result = dao.checkDuplicatedemail(email);
			
			// 중복이 안된 이메일이면
			if (result) {
				//mail server 설정

				String smtpEmail = "jsungj3@gmail.com"; 
				String password = "uliauyosxkhulgmg";

				//메일 받을 주소
				String to_email = email;
				/* Properties p = new Properties(); */
		        Properties p = System.getProperties();	
				p.setProperty("mail.transport.protocol", "smtp");
				/* p.setProperty("mail.host", "smtp.gmail.com"); */
		        p.put("mail.smtp.host", "smtp.gmail.com");
		        p.put("mail.smtp.port", "587");
		        p.put("mail.smtp.auth", "true");
			    p.put("mail.smtp.debug", "true");
		        p.put("mail.smtp.starttls.enable", "true");
		        p.put("mail.smtp.ssl.protocols", "TLSv1.2");
		        p.put("mail.smtp.socketFactory.port", "587");
		        p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		       
		        
		        //인증 번호 생성기
				StringBuffer temp =new StringBuffer();
				Random rnd = new Random();
				for(int i=0;i<10;i++)
				{
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
				System.out.println(AuthenticationKey);

				Session session = Session.getInstance(p, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(smtpEmail,password);
					}
				});
				
				//email 전송
				try {
					MimeMessage msg = new MimeMessage(session);
			
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
					
					System.out.println(msg);
					//메일 제목
					msg.setSubject("셀리마켓의 회원가입 인증번호");
					//메일 내용
					msg.setText("셀리마켓의 회원가입을 위한 인증 번호는 ["+temp +"] 입니다");
					
					Transport t = session.getTransport("smtp");
					t.connect(smtpEmail,password);
					t.sendMessage(msg, msg.getAllRecipients());
					t.close();
					
					
					HttpSession session1 = request.getSession();
					Map<String, Object> data = new HashMap<>();
					PrintWriter out = response.getWriter();
					
					session1.setAttribute("authentication", AuthenticationKey);
					data.put("authentication", AuthenticationKey);
					data.put("result", result);
					out.print(new Gson().toJson(data));
					out.flush();
					
					System.out.println("이메일 전송");

				}catch (Exception e) {
					e.printStackTrace();// TODO: handle exception
				}

			}
		}
		
	} // execute
}