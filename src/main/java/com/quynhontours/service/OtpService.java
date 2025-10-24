package com.quynhontours.service;

import java.io.UnsupportedEncodingException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class OtpService {

    private static OtpService instance;
    private final Map<String, OtpEntry> otpCache = new HashMap<>();

    // OTP sống trong 5 phút
    private static final long OTP_TTL_MS = 5 * 60 * 1000;

    private OtpService() {}

    public static synchronized OtpService getInstance() {
        if (instance == null) {
            instance = new OtpService();
        }
        return instance;
    }

    // Sinh mã OTP 6 số ngẫu nhiên
    private String generateOtp() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }

    // ✅ Gửi OTP qua email, trả về true/false
    public boolean sendOtp(String toEmail) {
        try {
            String otp = generateOtp();
            otpCache.put(toEmail, new OtpEntry(otp, System.currentTimeMillis()));
            sendEmail(toEmail, otp);
            System.out.println("✅ Sent OTP to " + toEmail + ": " + otp);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Xác thực OTP
    public boolean validateOtp(String email, String otpInput) {
        if (email == null || otpInput == null) return false;

        OtpEntry entry = otpCache.get(email);
        if (entry == null) return false;

        long now = System.currentTimeMillis();
        if (now - entry.createdAt > OTP_TTL_MS) {
            otpCache.remove(email);
            return false;
        }

        if (entry.otp.equals(otpInput.trim())) {
            otpCache.remove(email);
            return true;
        }

        return false;
    }

    // ✅ Gửi email OTP qua SMTP Gmail
    private void sendEmail(String toEmail, String otp)
            throws MessagingException, UnsupportedEncodingException {
        final String fromEmail = "lenguyenanhmai05@gmail.com";
        final String password = "yfhshadwelhwvwrf"; // App password Gmail

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
//thêm nè
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(fromEmail, "QuyNhonTour Support"));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
        message.setSubject("Mã OTP xác thực QuyNhonTour");
        message.setText("Xin chào,\n\nMã OTP của bạn là: " + otp +
                "\nMã có hiệu lực trong 5 phút.\n\nTrân trọng,\nQuyNhonTour Team");

        Transport.send(message);
    }

    // ✅ Lớp nội bộ lưu OTP
    private static class OtpEntry {
        String otp;
        long createdAt;

        OtpEntry(String otp, long createdAt) {
            this.otp = otp;
            this.createdAt = createdAt;
        }
    }
}
