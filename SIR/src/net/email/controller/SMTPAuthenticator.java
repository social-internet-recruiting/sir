package net.email.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {
	protected PasswordAuthentication getPasswordAuthentication() {
		String id = "social_recruiting";
		String pass = "social123";
		return new PasswordAuthentication(id, pass);
	}
}
