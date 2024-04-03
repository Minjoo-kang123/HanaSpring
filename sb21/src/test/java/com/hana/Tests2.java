package com.hana;

import com.hana.app.data.dto.CustDto;
import com.hana.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class Tests2 {

    @Autowired
    CustService custService;
    @Test
    void contextLoads() {
        CustDto c = CustDto.builder().custId("1").pwd("pwdxx").name("james").build();

        try {
            custService.get("12");
            log.info("----------OK----------------");
        } catch (Exception e) {
            e.printStackTrace();
            log.info("----------no----------------");
        }
    }

}
