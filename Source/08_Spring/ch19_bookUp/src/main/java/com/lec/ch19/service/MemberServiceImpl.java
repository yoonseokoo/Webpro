package com.lec.ch19.service;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.lec.ch19.dao.MemberDao;
import com.lec.ch19.dto.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao; //dao 에 있는 함수들 호출하기 위해
	@Autowired
	private JavaMailSenderImpl mailSender;
	@Override
	public int idConfirm(String mid) {
		return memberDao.idConfirm(mid);
	}

	@Override
	public int joinMember(final Member member, HttpSession httpSession) {
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "<div id=\"wrap\" style=\"text-align:center; width:500px; margin:0 auto;\">\n" + 
					"	<h1 style=\"color:#535E7F; font-size:4em\">Welcome Mr/Mrs " + member.getMname() + "</h1>\n" + 
					"	<p> Thank you for signing up. Here is a welcome discount coupon</p>\n" + 
					"	<p>\n" + 
					"		<img src=\"http://localhost:8090/ch19/img/coupon.jpg\">\n" + 
					"	</p>\n" + 
					"	<p style=\"color:blue\">파란 글씨 부분</p> \n" + 
					"		<img src=\"https://ichef.bbci.co.uk/news/976/cpsprodpb/11F83/production/_126030637_hi077595101.jpg\">\n" + 
					"		<p>서울시 어떤구 몰라17길 51 어떤빌딩 4층</p>\n" + 
					"	</div>";
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMmail()));
				mimeMessage.setFrom(new InternetAddress("yoonseokoo@gmail.com"));
				mimeMessage.setSubject("Mr/Mrs, " + member.getMname() + ", thank you for signing up");
				mimeMessage.setText(content, "utf-8", "html");
				
			}
		};
		mailSender.send(message);
		httpSession.setAttribute("mid",  member.getMid());
		return memberDao.joinMember(member);
	}

	@Override
	public String loginCheck(String mid, String mpw, HttpSession httpSession) {
		String result = "Login successful";
		Member member = memberDao.getDetailMember(mid);
		if(member==null) {
			result = "Not a valid ID";
		} else if (mpw.equals(member.getMpw())) {
			result = "Password is incorrent. Please check your password";
		} else {
			httpSession.setAttribute("member", member);
			httpSession.setAttribute("mid", mid);
		}
		return result;
	}

	@Override
	public Member getDetailMember(String mid) {
		return memberDao.getDetailMember(mid);
	}

	@Override
	public int modifyMember(Member member) {
		return memberDao.modifyMember(member);
	}

}
