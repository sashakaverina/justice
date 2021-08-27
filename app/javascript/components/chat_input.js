const clearMsg = () => {
    const inputField = () => {
        const chatInput = document.querySelector('.message-content');
        const approveMsg = document.querySelector('#approve-msg');
        const chatBtn = document.querySelector('.chat-button');
        if(chatInput){
            if(approveMsg){
                if(chatBtn){
                    chatBtn.addEventListener('click', (event) => {
                        chatInput.innerHTML = ' ';
                        approveMsg.innerHHTML = ' ';
                    });
                }
            }
        }
    }
}

export { clearMsg };
