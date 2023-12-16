package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.cookie.CookieUtils;

import javax.mail.*;
import javax.mail.internet.MimeMessage;

import javax.mail.internet.InternetAddress;
import java.io.IOException;
import java.util.Properties;

@WebServlet(name = "ForgotPasswordServlet", urlPatterns = {"/ForgotPass"})
public class ForgotPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = null;
        try {
            url = "/nhap_email.jsp";
            String action = request.getParameter("action");
            if (action == null) {
                action = "join";
            }
            if (action.equals("join")) {
                url = "/nhap_email.jsp";
            }
            if (action.equals("EnterEmail")) {
                String email = request.getParameter("email");
                String otp;
                CookieUtils cookieUtils = new CookieUtils();
                Boolean setOTP = cookieUtils.setOTP(response, request);
                if (!setOTP) {
                    url = "/sign_in_error.jsp";
                    request.setAttribute("error", "Can not get");
                    getServletContext().getRequestDispatcher(url).forward(request, response);
                    return;
                }
                otp = cookieUtils.getOTPSentToUserFromCookieOrStorage(request);
                sendMailToUser(email, otp);
                url = "/nhap_otp.jsp";
            }
        } catch (Exception e) {
            // Handle exceptions more gracefully, redirect to an error page
            response.sendRedirect(request.getContextPath() + "/error_notification.jsp?error=" + e.getMessage());
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
        return;
    }
    static final String fromEmail = "trongvumaimtv@gmail.com";// Email người gửi
    static final String password = "klfnasnzxuvnkddy";
    private Properties prop;
    private Session session;
    public void sendMailToUser(String email, String otp){
        prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
        // Creating a new session with an authenticator
        session = Session.getInstance(prop, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });
        try {
            // Create a default MimeMessage object
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail)); // Use your actual sender's email address here
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email)); // 'email' is the recipient's email address
            message.setSubject("Account Creation Successful for " + email);
            // Create the content of the email
            String content = "Dear,\n\n" +
                    "Here is your otp.\n\n" + otp +
                    "Best Regards,\n" +
                    "TS Tech\n";
            message.setText(content);
            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
