package com.hana.scheduler;

import com.hana.app.data.msg.AdminMsg;
import com.hana.app.data.msg.Msg;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


import java.util.Random;

@Component
@RequiredArgsConstructor
public class Scheduler {
    //웹소켓을 이용할 때 해당 객체가 필요함
    private final SimpMessageSendingOperations messagingTemplate;
    @Scheduled(cron = "*/3 * * * * *")
    public void cronJobDailyUpdate() {

        System.out.println("----------- Scheduler ------------");
        AdminMsg msg = new AdminMsg();
        Random r = new Random();
        int num1 = r.nextInt(100)+1;
        int num2 = r.nextInt(1000)+1;
        int num3 = r.nextInt(500)+1;
        int num4 = r.nextInt(10)+1;
        msg.setContent1(num1);
        msg.setContent2(num2);
        msg.setContent3(num3);
        msg.setContent4(num4);
        messagingTemplate.convertAndSend("/send2", msg);
    }

    @Scheduled(cron = "1 0 0 1,8,15,22 * *")
    public void cronJobWeeklyUpdate(){

    }


}