package com.quynhontours.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.chat.completions.ChatCompletion;
import com.openai.models.chat.completions.ChatCompletionCreateParams;

import java.util.stream.Collectors;

@WebServlet("/chat") // khớp với fetch('<%= request.getContextPath() %>/chat')
public class ChatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OpenAIClient openAIClient;

    @Override
    public void init() throws ServletException {
        super.init();
        // ⚠️ KHÔNG nên hardcode API key trong code thật.
        // Dưới đây chỉ là ví dụ, bạn nên chuyển sang System.getenv("OPENAI_API_KEY")
        String apiKey = "";

        openAIClient = OpenAIOkHttpClient.builder()
                .apiKey(apiKey)
                .build();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        String message = request.getParameter("message");

        if (message == null || message.trim().isEmpty()) {
            response.getWriter().write("{\"reply\":\"Bạn chưa nhập gì cả.\"}");
            return;
        }

        try {
            // Tạo request gửi đến OpenAI
            ChatCompletionCreateParams params = ChatCompletionCreateParams.builder()
                    .model("gpt-4o-mini") // model nhẹ, nhanh hơn gpt-4
                    .addUserMessage(message)
                    .build();

            ChatCompletion completion = openAIClient.chat().completions().create(params);

            // Lấy nội dung trả về (Optional<String>)
            String aiReply = completion.choices().stream()
                    .map(c -> c.message().content().orElse(""))
                    .collect(Collectors.joining("\n"));

            // Gửi về cho AJAX (JSON)
            response.getWriter().write("{\"reply\":\"" + escapeJson(aiReply) + "\"}");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"reply\":\"⚠️ Đã xảy ra lỗi khi gọi OpenAI: "
                    + escapeJson(e.getMessage()) + "\"}");
        }
    }

    private String escapeJson(String text) {
        if (text == null) return "";
        return text.replace("\\", "\\\\")
                   .replace("\"", "\\\"")
                   .replace("\n", "\\n")
                   .replace("\r", "");
    }
}
