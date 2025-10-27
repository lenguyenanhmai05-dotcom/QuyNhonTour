<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chat với NOU</title>
<style>
  /* === KHUNG CHAT CHÍNH === */
  .chatbox {
    position: fixed;
    bottom: 60px;
    right: 180px; /* đẩy sang trái để không che con cáo */
    width: 330px;
    background: #ffffff;
    border-radius: 15px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.25);
    overflow: hidden;
    display: none;
    flex-direction: column;
    z-index: 1000;
    animation: fadeIn 0.4s ease;
  }

  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
  }

  .chat-header {
    background: linear-gradient(90deg, #00bcd4, #2196f3);
    color: #fff;
    padding: 14px;
    font-weight: 600;
    display: flex;
    justify-content: space-between;
    align-items: center;
    letter-spacing: 0.3px;
  }

  .chat-header button {
    background: transparent;
    border: none;
    color: white;
    font-size: 18px;
    cursor: pointer;
  }

  .chat-body {
    padding: 15px;
    max-height: 320px;
    overflow-y: auto;
    display: flex;
    flex-direction: column;
    gap: 8px;
    background: #fafafa;
    font-size: 14px;
  }

  .chat-message {
    padding: 9px 13px;
    border-radius: 10px;
    width: fit-content;
    max-width: 78%;
    line-height: 1.4;
  }

  .chat-message.user {
    background-color: #2196f3;
    color: #fff;
    align-self: flex-end;
    border-bottom-right-radius: 0;
  }

  .chat-message.bot {
    background-color: #e3f2fd;
    color: #000;
    align-self: flex-start;
    border-bottom-left-radius: 0;
  }

  .chat-input {
    display: flex;
    border-top: 1px solid #ddd;
    background: #fff;
  }

  .chat-input input {
    flex: 1;
    padding: 12px;
    border: none;
    outline: none;
    font-size: 14px;
    border-radius: 0 0 0 15px;
  }

  .chat-input button {
    background: #2196f3;
    color: white;
    border: none;
    padding: 12px 16px;
    cursor: pointer;
    font-weight: bold;
    border-radius: 0 0 15px 0;
    transition: 0.3s;
  }

  .chat-input button:hover {
    background: #1565c0;
  }

  /* === NÚT CON CÁO (NOU) === */
  .chat-nou {
    position: fixed;
    bottom: 30px;
    right: 30px;
    width: 130px;
    height: 130px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    animation: float 3s ease-in-out infinite;
    z-index: 9999;
    transition: transform 0.3s ease;
  }

  .chat-nou:hover {
    transform: scale(1.07);
  }

  .nou-img {
    width: 100px;
    height: 100px;
    object-fit: contain;
    z-index: 2;
  }

  /* chữ cong "Chat with NOU" */
  .chat-nou-text {
    position: absolute;
    width: 160px;
    height: 100px;
    top: -30px;
    pointer-events: none;
  }

  @keyframes float {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-6px); }
  }

  .chat-nou-text text {
    fill: url(#textGradient);
  }
</style>
</head>
<body>

<!-- === KHUNG CHAT === -->
<div class="chatbox" id="chatbox">
  <div class="chat-header">
    Chat với NOU 🐬
    <button id="closeChat">×</button>
  </div>
  <div class="chat-body" id="chatBody">
    <div class="chat-message bot">Xin chào! 👋 Mình là NOU, bạn cần giúp gì nào?</div>
  </div>
  <div class="chat-input">
    <input type="text" id="chatInput" placeholder="Nhập tin nhắn...">
    <button id="sendBtn">Gửi</button>
  </div>
</div>

<!-- === NÚT NỔI CON CÁO === -->
<div class="chat-nou" id="openChat">
  <img src="images/nou.png" alt="Chat with NOU" class="nou-img">
  <svg viewBox="0 0 200 100" class="chat-nou-text">
    <defs>
      <linearGradient id="textGradient" x1="0%" y1="0%" x2="100%" y2="0%">
        <stop offset="0%" stop-color="#00bcd4">
          <animate attributeName="offset" values="0;1;0" dur="3s" repeatCount="indefinite"/>
        </stop>
        <stop offset="100%" stop-color="#2196f3">
          <animate attributeName="offset" values="1;0;1" dur="3s" repeatCount="indefinite"/>
        </stop>
      </linearGradient>
    </defs>
    <path id="arcPath" d="M 30,100 A 70,70 0 0,1 170,100" fill="none" stroke="none"/>
    <text font-size="14" font-weight="600">
      <textPath href="#arcPath" startOffset="50%" text-anchor="middle">
        Chat with NOU
      </textPath>
    </text>
  </svg>
</div>

<script>
  const chatbox = document.getElementById('chatbox');
  const openBtn = document.getElementById('openChat');
  const closeBtn = document.getElementById('closeChat');
  const sendBtn = document.getElementById('sendBtn');
  const chatBody = document.getElementById('chatBody');
  const chatInput = document.getElementById('chatInput');

  // Mở khung chat
  openBtn.addEventListener('click', () => {
    chatbox.style.display = 'flex';
    chatInput.focus();
  });

  // Đóng khung chat
  closeBtn.addEventListener('click', () => {
    chatbox.style.display = 'none';
  });

  // Gửi tin nhắn
  sendBtn.addEventListener('click', sendMessage);
  chatInput.addEventListener('keypress', e => {
    if (e.key === 'Enter') {
      e.preventDefault();
      sendMessage();
    }
  });

  // === Hàm gửi tin nhắn ===
  function sendMessage() {
    const msg = chatInput.value.trim();
    if (!msg) return;

    appendMessage('user', msg);
    chatInput.value = '';
    appendTyping();

    fetch('<%= request.getContextPath() %>/chat', {
  method: 'POST',
  headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
  body: 'message=' + encodeURIComponent(msg)
})

    .then(res => res.json())
    .then(data => {
      removeTyping();
      appendMessage('bot', data.reply);
    })
    .catch(err => {
      removeTyping();
      appendMessage('bot', '⚠️ Không thể kết nối tới NOU. Vui lòng thử lại!');
      console.error('Chat error:', err);
    });
  }

  function appendMessage(sender, text) {
    const msg = document.createElement('div');
    msg.classList.add('chat-message');
    msg.classList.add(sender === 'user' ? 'user' : 'bot');
    msg.textContent = text;
    chatBody.appendChild(msg);
    chatBody.scrollTop = chatBody.scrollHeight;
  }

  function appendTyping() {
    const typing = document.createElement('div');
    typing.classList.add('chat-message', 'bot');
    typing.id = 'typing';
    typing.textContent = 'NOU đang gõ... 💭';
    chatBody.appendChild(typing);
    chatBody.scrollTop = chatBody.scrollHeight;
  }

  function removeTyping() {
    const typing = document.getElementById('typing');
    if (typing) typing.remove();
  }
</script>

</body>
</html>
