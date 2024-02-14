package com.market.command;

import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.jni.Address;

import com.google.gson.Gson;
import com.market.dao.SignUpDao;
import com.market.util.Gmail;
import com.market.util.SHA256;
import com.mysql.cj.protocol.Message;

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
				String host = "http://localhost:8080/SellreMarket/"; // 프로젝트 domain
				String from = "jsungj3@gmail.com"; // 누가 보낼 것인가?
				String to = email; // 회원가입 시도 한 계정 
				String subject = "셀리마켓 회원가입을 위한 인증 이메일입니다."; // 제목
				String content = "회원 가입에 동의하시면 이메일 인증을 진행 하세요. " + // 내용
					"<a href='" + host + "mainPage.do?code=" + new SHA256().getSHA256(to) + "'> 이메일 인증하기 </a>";
				
				Properties p = new Properties();
				p.put("mail.smtp.user", from); // 어떤 계정으로부터보낼 것인가?
				p.put("mail.smtp.host", "smtp.googlemail.com"); // 구글 
				p.put("mail.smtp.port", "465"); // 구글 전용 포트 번호
				p.put("mail.smtp.starttls.enable", "true");
				p.put("mail.smtp.auth", "true"); // 인증
				p.put("mail.smtp.debug", "true"); // 디버그
				p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLsocketFactory");
				p.put("mail.smtp.socketFactory.fallback", "false");
				
				
				try {
					PrintWriter out = response.getWriter();
					Authenticator auth = new Gmail();
					Session ses = Session.getInstance(p, auth);
					ses.setDebug(true);
					
					MimeMessage msg = new MimeMessage(ses);
					msg.setSubject(subject);
					
					Address formAdd = new InternetAddress(from);
					msg.setFrom(formAdd);
					
					Address toAdd = new InternetAddress(to);
					msg.addRecipient(Message.RecipientType.TO, toAdd);
					
					msg.setContent(content, "text/html;charset=UTF8");
					
					Transport.send(msg);
					
					out.print(new Gson().toJson(result));
					out.flush();
					
				}catch(Exception e) {
					e.printStackTrace();
					System.out.println("errorrrr");
					
				}
			}
		}
		
	} // execute
}