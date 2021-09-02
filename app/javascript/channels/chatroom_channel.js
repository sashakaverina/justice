import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data.their)
        messagesContainer.insertAdjacentHTML('beforeend',
        `
        <div class="chat-bubble">
          ${data.their}
        </div>
        `
        );
      document.getElementById('messages').scrollIntoView(0, document.getElementById('messages').scrollHeight);
      },
    });
  }
}

export { initChatroomCable };