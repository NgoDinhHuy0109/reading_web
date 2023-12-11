package controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.AccountsEntity;
import models.UserInfoEntity;
import Service.Account;
import Service.User;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;
import java.util.Properties;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {
    private final Account accountApplication = new Account(new AccountsEntity());
    private final User userApplication = new User(new UserInfoEntity());
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String url = "/sign_up.jsp";
            String action = request.getParameter("action");
            if (action == null) {
                action = "join";
            }
            if (action.equals("join")) {
                url = "/sign_up.jsp";
            }
            if (action.equals("SignUp")) {
                // Retrieve user inputs
                String fullName = request.getParameter("fullName");
                String dobParameter = request.getParameter("dateOfBirth");
                Date dateOfBirth = null;
                try {
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    dateOfBirth = dateFormat.parse(dobParameter);
                } catch (ParseException e) {
                    // Handle the parsing exception appropriately
                    e.printStackTrace(); // Log the exception or throw a ServletException
                }
                String email = request.getParameter("email");
                String phoneNumber = request.getParameter("phoneNumber");
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");
                String userImage = request.getParameter("titleImg");
                // Validate inputs
                if (userApplication.isEmailExists(email)) {
                    // Handle case where email already exists
                    url = "/sign_up_error.jsp";
                    request.setAttribute("error", "Email already exists");
                    getServletContext().getRequestDispatcher(url).forward(request, response);
                    return;
                }
                if (userApplication.isPhoneNumberExists(phoneNumber)) {
                    // Handle case where email already exists
                    url = "/sign_up_error.jsp";
                    request.setAttribute("error1", "Phone number already exists");
                    getServletContext().getRequestDispatcher(url).forward(request, response);
                    return;
                }
                if (accountApplication.isAccountExists(userName)) {
                    // Handle case where email already exists
                    url = "/sign_up_error.jsp";
                    request.setAttribute("error2", "Username already exists");
                    getServletContext().getRequestDispatcher(url).forward(request, response);
                    return;
                }
                getServletContext().getRequestDispatcher(url).forward(request, response);
                // Add more specific validation as needed
                // Create UserInfoEntity and AccountsEntity
                UserInfoEntity userInfosEntity = new UserInfoEntity(fullName, dateOfBirth, email, phoneNumber,userImage);
                AccountsEntity accountsEntity = new AccountsEntity(userName, password);
                try {
                    // Create user account
                    accountApplication.createAccounts(accountsEntity);
                    // Create user information
                    userApplication.createUsers(userInfosEntity, accountsEntity.getAccountId());
                    sendMailToUser(email);
                    url = "/sign_in.jsp";
                    getServletContext().getRequestDispatcher(url).forward(request, response);
                    return;
                } catch (Exception e) {
                    url = "/error_notification.jsp";
                    request.setAttribute("error", e.getMessage());
                }
            }
            getServletContext().getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            // Handle exceptions more gracefully, redirect to an error page
            response.sendRedirect(request.getContextPath() + "/error_notification.jsp?error=" + e.getMessage());
        }
    }
    static final String fromEmail = "trongvumaimtv@gmail.com";// Email người gửi
    static final String password = "klfnasnzxuvnkddy";
    private Properties prop;
    private Session session;

    public void sendMailToUser(String email){
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
                    "Thank you for joining with us. We wish we can have perfect time togehter.\n" +
                    "Best Regards,\n" +
                    "From news\n";

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

