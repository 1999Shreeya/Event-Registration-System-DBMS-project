package mail;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
public static boolean send(String to,String subject,String msg){

    final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
    final String user="bookmyevent19@gmail.com";
    final String pass="BME123456";

    //1st step) Get the session object	
    Properties props = new Properties();
    props.setProperty("mail.smtp.host", "smtp.gmail.com");
    props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
    props.setProperty("mail.smtp.socketFactory.fallback", "false");
    props.setProperty("mail.smtp.port", "465");
    props.setProperty("mail.smtp.socketFactory.port", "465");
    props.put("mail.smtp.auth", "true");
    props.put("mail.debug", "true");
    props.put("mail.store.protocol", "pop3");
    props.put("mail.transport.protocol", "smtp");

    Session session = Session.getDefaultInstance(props,
     new javax.mail.Authenticator() {
      @Override
      protected PasswordAuthentication getPasswordAuthentication() {
       return new PasswordAuthentication(user,pass);
       }
    });
    //2nd step)compose message
    try {
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(user));
        message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
        message.setSubject(subject);
        message.setText(msg);

        //3rd step)send message
        Transport.send(message);

        System.out.println("Done");
        return true;
     } catch (MessagingException e) {
            throw new RuntimeException(e);
     }

    }
}

