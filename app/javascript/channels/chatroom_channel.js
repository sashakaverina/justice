import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    const userId = parseInt(messagesContainer.dataset.userId, 10);

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        if(userId !== data.userId) {
          messagesContainer.insertAdjacentHTML('beforeend',
          `
          <div class="chat-bubble">
            ${data.their}
          </div>
          `
          );
        }
      document.getElementById('messages').scrollIntoView(0, document.getElementById('messages').scrollHeight);
      },
    });
  }
}

export { initChatroomCable };