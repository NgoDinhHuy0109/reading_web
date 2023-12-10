package Service;

import java.security.SecureRandom;
import java.util.Base64;

public class OTPGenerator {
    private static final String OTP_CHARS = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    private static final int OTP_LENGTH = 6; // Độ dài của mã OTP

    public static String generateOTP() {
        SecureRandom random = new SecureRandom();
        StringBuilder otp = new StringBuilder(OTP_LENGTH);

        for (int i = 0; i < OTP_LENGTH; ++i) {
            int index = random.nextInt(OTP_CHARS.length());
            otp.append(OTP_CHARS.charAt(index));
        }

        return otp.toString();
    }
    public static String encodeOTP(String otp) {
        byte[] encodedBytes = Base64.getEncoder().encode(otp.getBytes());
        return new String(encodedBytes);
    }
}
