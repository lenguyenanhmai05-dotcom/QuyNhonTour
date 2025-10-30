// package com.quynhontours.service;

// import com.quynhontours.model.Tour;
// import java.util.List;
// import java.util.regex.Matcher;
// import java.util.regex.Pattern;

// public class ChatOrchestrator {

//     private final TourService tourService;
//     private final AiChatService ai;

//     public ChatOrchestrator(TourService tourService, AiChatService ai) {
//         this.tourService = tourService;
//         this.ai = ai;
//     }

//     public String reply(String userMsg) {
//         String lower = userMsg.toLowerCase();

//         // Hỏi giá tour
//         if (lower.contains("giá") || lower.contains("bao nhiêu")) {
//             Tour t = resolveTour(userMsg);
//             if (t != null) {
//                 return String.format(
//                     "Tour %s (%s) đi từ %s đến %s. Giá người lớn: %.0f VND, trẻ em: %.0f VND. Khởi hành tại %s.",
//                     t.getName(), t.getDuration(), t.getStartDate(), t.getEndDate(),
//                     t.getAdultPrice(), t.getChildPrice(), t.getDeparture()
//                 );
//             }
//         }

//         // Hỏi về thời gian hoặc khởi hành
//         if (lower.contains("khởi hành") || lower.contains("thời gian") ||
//             lower.contains("bao lâu") || lower.contains("ngày đi")) {
//             Tour t = resolveTour(userMsg);
//             if (t != null) {
//                 return String.format(
//                     "Tour %s khởi hành từ %s, điểm đến %s, thời gian %s (%s - %s).",
//                     t.getName(), t.getDeparture(), t.getDestination(),
//                     t.getDuration(), t.getStartDate(), t.getEndDate()
//                 );
//             }
//         }

//         // Nếu không match rõ ràng => dùng AI, kèm context dữ liệu thật
//         String dataContext = buildDataContext(userMsg);
//         String systemPrompt =
//             "Bạn là trợ lý tư vấn du lịch cho website QNtour. " +
//             "Dưới đây là danh sách tour hiện có. " +
//             "Chỉ sử dụng dữ liệu này để trả lời câu hỏi về giá, thời gian, khởi hành, điểm đến. " +
//             "Nếu không tìm thấy thông tin, hãy nói lịch sự rằng chưa có dữ liệu và gợi ý khách mở trang chi tiết tour. " +
//             "Trả lời ngắn gọn, tiếng Việt.\n\n" +
//             "DỮ LIỆU:\n" + dataContext;

//         return ai.ask(systemPrompt, userMsg);
//     }

//     private Tour resolveTour(String text) {
//         Tour t = tourService.findBySlug(text);
//         if (t == null) {
//             List<Tour> results = tourService.search(text, 1);
//             if (!results.isEmpty()) t = results.get(0);
//         }
//         return t;
//     }

//     private String buildDataContext(String keyword) {
//         List<Tour> tours = tourService.search(keyword, 5);
//         StringBuilder sb = new StringBuilder();
//         for (Tour t : tours) {
//             sb.append("- ").append(t.getName())
//               .append(" | Điểm đến: ").append(t.getDestination())
//               .append(" | Khởi hành: ").append(t.getDeparture())
//               .append(" | Thời gian: ").append(t.getDuration())
//               .append(" | Giá NL: ").append(String.format("%.0f", t.getAdultPrice())).append(" VND")
//               .append(", TE: ").append(String.format("%.0f", t.getChildPrice())).append(" VND")
//               .append(" | Từ ").append(t.getStartDate())
//               .append(" đến ").append(t.getEndDate()).append("\n");
//         }
//         return sb.toString();
//     }
// }
