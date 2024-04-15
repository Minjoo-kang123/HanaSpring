package com.hana;

import com.hana.app.service.CustService;
import com.hana.util.StringEnc;
import lombok.extern.slf4j.Slf4j;
import org.jasypt.encryption.pbe.StandardPBEBigDecimalEncryptor;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class Tests3 {

    @Test
    void contextLoads() {
        String text = "abd";
        String atext = StringEnc.encryptor(text);
        String aatext = StringEnc.decryptor(atext);
        log.info("----------OK----------------" + atext);
        log.info("----------OK----------------" + aatext);
    }

}
