package com.hana;

import com.hana.app.data.dto.CustDto;
import com.hana.app.service.CustService;
import com.hana.util.ChatBotUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class Tests {


    @Value("${app.key.chatbot_key}")
    private String secretKey;
    @Value("${app.key.chatbot_url}")
    private String apiUrl;

    @Test
    void contextLoads() throws Exception {
        String msg = "힘들겠네";
        String result = ChatBotUtil.getMsg(apiUrl,secretKey,msg);
        System.out.println(result);
    }

}
