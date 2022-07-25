package com.lec.ch18;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private JavaMailSender mailSender;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "join";
	}
	@RequestMapping(value = "textMail", method = RequestMethod.GET)
	public String textMail(String name, String email, Model model) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("yoonseokoo@gmail.com"); //admin's email address
		message.setTo(email); //reciever's mail
		message.setSubject("[ TEXT welcome message ]" + name + ", thank you for subscribing"); //mail title
		String content = "Mr/Mrs " + name + ", thank you for signing up\n ";
		message.setText(content); //content of the mail
		
		mailSender.send(message); //send mail
		model.addAttribute("mailSendResult", "TEXT mail has been sent");
		return "sendResult";
	}
	@RequestMapping(value="htmlMail", method= RequestMethod.GET) //sending message that reads HTML tags
	public String htmlMail(final String name, final String email, Model model) {
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "<div id=\"wrap\" style=\"text-align:center; width:500px; margin:0 auto;\">\n" + 
					"	<h1 style=\"color:#535E7F; font-size:4em\">Welcome Mr/Mrs " + name + "</h1>\n" + 
					"	<p> Thank you for signing up. Here is a welcome discount coupon</p>\n" + 
					"	<p>\n" + 
					"		<img src=\"http://localhost:8090/ch18/resources/coupon.jpg\">\n" + 
					"	</p>\n" + 
					"	<p style=\"color:blue\">파란 글씨 부분</p> \n" + 
					"		<img src=\"https://ichef.bbci.co.uk/news/976/cpsprodpb/11F83/production/_126030637_hi077595101.jpg\">\n" + 
					"		<p>서울시 어떤구 몰라17길 51 어떤빌딩 4층</p>\n" + 
					"	</div>";
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				//Sender's email address, reciever's mail address, mail's title, utf-8 setting
				
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email)); ///sender's information
				mimeMessage.setFrom(new InternetAddress("yoonseokoo@gmail.com"));
				mimeMessage.setSubject("[ TEXT welcome message ]" + name + ", thank you for subscribing");
				mimeMessage.setText(content, "utf-8", "html");
				
			}
		};
		mailSender.send(message);
		model.addAttribute("mailSendResult", "HTML mail has been sent");
		return "sendResult";
	}
}

