package Service;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;


public class EmailSender {
    public static void sendOTPEmail(String toEmail, String otp) {
        // Cấu hình thông tin email
        String fromEmail = "yourEmailAddress@gmail.com"; // Email người gửi
        String password = "yourEmailPassword"; // Mật khẩu email
        String host = "smtp.gmail.com"; // Host của dịch vụ email (ví dụ: Gmail)
            try {
                // Tạo đối tượng Email
                Email email = new HtmlEmail();
                email.setHostName(host);
                email.setSmtpPort(587);
                email.setAuthenticator(new DefaultAuthenticator(fromEmail, password));
                email.setStartTLSEnabled(true);
            }
            catch (Exception e) {
            // Thiết lập thông tin người gửi, người nhận và tiêu đề
       }
    }
}

