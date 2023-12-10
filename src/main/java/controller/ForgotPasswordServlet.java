package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.cookie.CookieUtils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Properties;

import static Service.OTPGenerator.generateOTP;

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
                sendOTPEmail(email, otp);
            }
        } catch (Exception e) {
            // Handle exceptions more gracefully, redirect to an error page
            response.sendRedirect(request.getContextPath() + "/error_notification.jsp?error=" + e.getMessage());
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
        return;
    }
    static final String fromEmail = "ngodinhhuy38@gmail.com";// Email người gửi
    static final String password = "Ndh192003";
    public static void sendOTPEmail(String toEmail, String otp) {
        // Cấu hình thông tin email
        // Mật khẩu email
        String host = "smtp.gmail.com"; // Host của dịch vụ email (ví dụ: Gmail)

        // Cấu hình properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com"); // Thay bằng SMTP server của bạn (ví dụ: smtp.gmail.com)
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });


        try {
            // Tạo đối tượng MimeMessage
            MimeMessage message = new MimeMessage(session);

            // Thiết lập thông tin người gửi, người nhận và tiêu đề
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Your OTP for password reset");

            // Nội dung email (bao gồm mã OTP)
            String emailContent = "Your OTP for password reset is: " + otp;
            message.setText(emailContent);

            // Gửi email
            Transport.send(message);
            System.out.println("Email sent successfully to " + toEmail);
        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("Failed to send email to " + toEmail);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);

    }

}
