package com.hana;

import com.hana.app.data.dto.CustDto;
import com.hana.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class Tests {

    @Autowired
    CustService custService;
    @Test
    void contextLoads() {
        try {
            custService.get();
            log.info("----------OK----------------");
        } catch (Exception e) {
            e.printStackTrace();
            log.info("----------no----------------");
        }
    }

}
