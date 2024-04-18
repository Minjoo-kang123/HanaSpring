package com.hana.controller;

import com.hana.app.data.msg    .Msg;
import com.hana.util.ChatBotUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ChatbotController {

    final SimpMessagingTemplate template;

    @Value("${app.key.chatbot_key}")
    String secretKey;
    @Value("${app.key.chatbot_url}")
    String apiUrl;



    @MessageMapping("/sendchatbot") // 나에게만 전송 ex)Chatbot
    public void receiveme(Msg msg, SimpMessageHeaderAccessor headerAccessor) throws Exception {
        log.info(msg.toString());

        String result = ChatBotUtil.getMsg(apiUrl,secretKey,msg.getContent1());
        String id = msg.getSendid();
        msg.setContent1(result);
        msg.setSendid("CHATBOT");
        template.convertAndSend("/send/me/"+id, msg);
    }
}