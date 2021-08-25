const chatInput = document.getElementById('message_content');
console.log(chatInput);
const chatBtn = document.querySelector('.chat-button');

chatBtn.addEventListener('click', (event) => {
    chatInput.innerHTML = ' '; 
});