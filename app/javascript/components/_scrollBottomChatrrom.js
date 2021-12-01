const ScrollBottomChatroom = () => {
  const containerChat = document.querySelector(".container-chat")

  if (containerChat) {
    document.getElementById('message_content').scrollIntoView({behavior:'smooth'});
  } else {
    return
  }
}

export { ScrollBottomChatroom }
