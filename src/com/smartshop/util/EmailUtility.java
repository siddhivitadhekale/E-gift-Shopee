package com.smartshop.util;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Authenticator;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;

import com.smartshop.dao.UserDao;
import com.smartshop.dao.UserDaoImpl;
import com.smartshop.pojo.FriendPojo;

public class EmailUtility {
	
	public static boolean sendEmailUrl(String email ,String url)
	//public static boolean sendEmailUrl(String email ,String url,String pass)
	{
		final String userName="deduplicationprojectdemo@gmail.com";
		final String password="dedup@123";
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session=Session.getInstance(properties,
				new javax.mail.Authenticator(){
			        protected PasswordAuthentication getPasswordAuthentication(){
			        	 return new PasswordAuthentication(userName, password);
			        }
		});
		
		try
		{
			Message message=new MimeMessage(session);
			message.setFrom(new InternetAddress("ticketingsystem007@gmail.com"));
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
		    message.setSubject("EmailConfirmation");
		    message.setText("email :"+email +    "    URL :"  +url);
		//    message.setText("email :"+email +    "    URL :"  +url+    "    OldPassword :"  +pass);
			Transport.send(message);
            System.out.println("Done");
		}
		//?emailId='"+emailId+"'
		catch(MessagingException e)
		{
			throw new RuntimeException(e);
	}
		
		return true;
	
	}
	
	public static boolean sendEmailUtil(String email ,String pass)
	{
		final String userName="deduplicationprojectdemo@gmail.com";
		final String password="dedup@123";
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session=Session.getInstance(properties,
				new javax.mail.Authenticator(){
			        protected PasswordAuthentication getPasswordAuthentication(){
			        	 return new PasswordAuthentication(userName, password);
			        }
		});
		
		try
		{
			Message message=new MimeMessage(session);
			message.setFrom(new InternetAddress("ticketingsystem007@gmail.com"));
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
		    message.setSubject("EmailConfirmation");
		    message.setText("email :"+email +    "    pass :"  +pass);
			Transport.send(message);
            System.out.println("Done");
		}
		//?emailId='"+emailId+"'
		catch(Exception e)
		{
			e.printStackTrace();
			
	}
		
		return true;
	
	}

	public static boolean sendEmail(String emailId ,String pass ,String add)
	{
		final String userName="deduplicationprojectdemo@gmail.com";
		final String password="dedup@123";
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session=Session.getInstance(properties,
				new javax.mail.Authenticator(){
			        protected PasswordAuthentication getPasswordAuthentication(){
			        	 return new PasswordAuthentication(userName, password);
			        }
		});
		
		try
		{
			Message message=new MimeMessage(session);
			message.setFrom(new InternetAddress("ticketingsystem007@gmail.com"));
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailId));
		    message.setSubject("EmailConfirmation");
		    message.setText("Email :"+emailId +    "    pass :"  +pass +"     Addrss :"+add);
			Transport.send(message);
            System.out.println("Done");
		}
		//?emailId='"+emailId+"'
		catch(MessagingException e)
		{
			throw new RuntimeException(e);
	}
		
		return true;
	
	}
	
	
	public static boolean sendEmail(String emailId, String OTPkey)
	{
		
		final String userName="deduplicationprojectdemo@gmail.com";
		final String password="dedup@123";
		Properties properties=new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session=Session.getInstance(properties,
				new javax.mail.Authenticator(){
			        protected PasswordAuthentication getPasswordAuthentication(){
			        	 return new PasswordAuthentication(userName, password);
			        }
		});
		
		try
		{
			Message message=new MimeMessage(session);
			message.setFrom(new InternetAddress("ticketingsystem007@gmail.com"));
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailId));
		    message.setSubject("OTP");
		    message.setText("OTP :"+OTPkey);
			Transport.send(message);
            System.out.println("Mail sent");
		}
		catch(MessagingException e)
		{
			throw new RuntimeException(e);
	}
		
		return true;
	
	}
	
	public static void sendEmail(String toAddress, String subject, String message, String attachFiles) throws AddressException, MessagingException {
 
		final String userName="deduplicationprojectdemo@gmail.com";
		final String password="dedup@123";
		
		
        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
        
 
        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };
        Session session = Session.getInstance(properties, auth);
        // creates a new e-mail message
        Message msg = new MimeMessage(session);
        
        MimeBodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setContent(message, "text/html");
        // creates multi-part
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
 
        // adds attachments
        
          
                MimeBodyPart attachPart = new MimeBodyPart();
 
                try {
                    attachPart.attachFile(attachFiles);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
 
                multipart.addBodyPart(attachPart);
         
        // sets the multi-part as e-mail's content
        msg.setContent(multipart);
        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        
        // sets the multi-part as e-mail's content
        msg.setContent(multipart);
 
        // sends the e-mail
        Transport.send(msg);
 }

	
	
	public static void sendEmail(String[] toAddress, String subject, String message, String attachFiles) throws AddressException, MessagingException {
		 
		final String userName="deduplicationprojectdemo@gmail.com";
		final String password="dedup@123";
		
		
        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
        
 
        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };
        Session session = Session.getInstance(properties, auth);
        // creates a new e-mail message
        Message msg = new MimeMessage(session);
        
        MimeBodyPart messageBodyPart = new MimeBodyPart();
        
        message="Reminder!! "+message+"<br/><br/><br/><br/><br/>Regards<br/> Dobell Team<br/>Support Mail: support@dobell.com<br/>Contact At: 999999999<br/>Website : wwww.dobell.com<br/><img src='https://mvp.tribesgds.com/dyn/jZ/XK/jZXKAfmm3Ek/_/tIIyubfFgL0/Enk3/dobell-logo.jpg'>";
        messageBodyPart.setContent(message, "text/html");
        // creates multi-part
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
 
        // adds attachments
        
          
                MimeBodyPart attachPart = new MimeBodyPart();
 
              /*  try {
                    attachPart.attachFile(attachFiles);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
 
                multipart.addBodyPart(attachPart);*/
         
        // sets the multi-part as e-mail's content
        msg.setContent(multipart);
        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toInternetAddress =new InternetAddress[toAddress.length]; 
        for(int i=0;i<toAddress.length;i++)
        {
        	if(toAddress[i]!= null)
        	toInternetAddress[i]=new InternetAddress(toAddress[i]);
        }
        InternetAddress[] toAddresses = toInternetAddress;
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        
        // sets the multi-part as e-mail's content
        msg.setContent(multipart);
 
        // sends the e-mail
        //System.out.println("Email Inside Sent");
        Transport.send(msg);
        System.out.println("Email Inside Sent Completed");
 }
	
	public static void checkMail(String hostval, String mailStrProt, String uname,String pwd) 
	   {
	      try {
	      //Set property values
	      Properties propvals = new Properties();
	      propvals.put("mail.pop3.host", hostval);
	      propvals.put("mail.pop3.port", "995");
	      propvals.put("mail.pop3.starttls.enable", "true");
	      Session emailSessionObj = Session.getDefaultInstance(propvals);  
	      //Create POP3 store object and connect with the server
	      Store storeObj = emailSessionObj.getStore("pop3s");
	      storeObj.connect(hostval, uname, pwd);
	      //Create folder object and open it in read-only mode
	      Folder emailFolderObj = storeObj.getFolder("INBOX");
	      emailFolderObj.open(Folder.READ_ONLY);
	      //Fetch messages from the folder and print in a loop
	      Message[] messageobjs = emailFolderObj.getMessages(); 
	      Set<String> emailList=new HashSet<String>();
	      for (int i = 0, n = messageobjs.length; i < n; i++) {
	    	  try{
	         Message indvidualmsg = messageobjs[i];
	        
	         System.out.println("Sender: " + indvidualmsg.getFrom()[0]);
	       // System.out.println("Content: " + indvidualmsg.getContent().toString());
	        emailList.add(indvidualmsg.getFrom()[0].toString());
	    	  }
	    	  catch(Exception e)
	    	  {
	    		  
	    	  }
	      }
	     
	     System.out.println("emailList size"+emailList.size());
	 	
	     UserDao user=new UserDaoImpl();
	 	FriendPojo friendpojo=new FriendPojo();
	     Iterator<String> iter = emailList.iterator();
	     while (iter.hasNext()) {
	    	 String tofriend=iter.next();
	    	
	    	 EmailUtility emailUtility=new EmailUtility();
	    	 String dd=emailUtility.getEmail(tofriend);
	    	 System.out.println("dd........."+dd);
	    	 if(dd!=null && !dd.equals(""))
	    	 {
		    	 friendpojo.setFrom_friend(uname);
		    	 friendpojo.setTo_friend(dd);
		    	 System.out.println("tofriend"+dd);
		    	 boolean x=user.sendRequest(friendpojo);
		    	  System.out.println(iter.next());
	    	 }
	    	 else
	    	 {
	    		 
	    	 }
	    	}

	      //Now close all the objects
	      emailFolderObj.close(false);
	      storeObj.close();
	      } catch (NoSuchProviderException exp) {
	         exp.printStackTrace();
	      } catch (MessagingException exp) {
	         exp.printStackTrace();
	      } catch (Exception exp) {
	         exp.printStackTrace();
	      }
	   }
	
	
	
	public static boolean sendEmailNotification(String fromuser,String to_friend,String password,String productName)
	{
		System.out.println("iiiiiiiiiiiiiiiiiiiiiiinnnnnnnnnnnnnnnnnn");
	/*	final String userName=fromuser;
		final String password1=password;*/
		final String userName="deduplicationprojectdemo@gmail.com";
		final String password1="dedup@123";
		System.out.println("11111111111111111111111111");
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session=Session.getInstance(properties,
				new javax.mail.Authenticator(){
			        protected PasswordAuthentication getPasswordAuthentication(){
			        	 return new PasswordAuthentication(userName,password1);
			        }
		});
		
		
		try
		{
				Message message=new MimeMessage(session);
				message.setFrom(new InternetAddress("ticketingsystem007@gmail.com"));
			    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to_friend));
			    message.setSubject("EmailConfirmation");
			    message.setText("user :"+fromuser +    "   reccommended "+productName+" product to you");
				Transport.send(message);
	            System.out.println("Done");
	            
			
		}
		//?emailId='"+emailId+"'
		catch(MessagingException e)
		{
			throw new RuntimeException(e);
	}
		
	return true;
	
	}

	public static String getEmail(String line){
		
		final String RE_MAIL = "([\\w\\-]([\\.\\w])+[\\w]+@([\\w\\-]+\\.)+[A-Za-z]{2,4})";
		Pattern p = Pattern.compile(RE_MAIL);
		Matcher m = p.matcher(line);
		while(m.find()) {
			return(m.group(1));
		}

		return null;
		
	}
	
	
	public static boolean sendInvoice(String emailId, String subject, String msg)
	{
		
		final String userName="deduplicationprojectdemo@gmail.com";
		final String password="dedup@123";
		Properties properties=new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session=Session.getInstance(properties,
				new javax.mail.Authenticator(){
			        protected PasswordAuthentication getPasswordAuthentication(){
			        	 return new PasswordAuthentication(userName, password);
			        }
		});
		
		try
		{
			Message message=new MimeMessage(session);
			message.setFrom(new InternetAddress("ticketingsystem007@gmail.com"));
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailId));
		    message.setSubject(subject);
		    message.setText(msg);
			Transport.send(message);
            System.out.println("Mail sent");
		}
		catch(MessagingException e)
		{
			throw new RuntimeException(e);
	}
		
		return true;
	
	}
	
	
	public static void main(String args[])
	{
		
		System.out.println(getEmail("dgsdsad asdsadsads vilas.sangre@gmail.com"));
	}
	

}
