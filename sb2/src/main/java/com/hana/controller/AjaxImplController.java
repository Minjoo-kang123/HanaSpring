package com.hana.controller;

import com.hana.app.data.dto.ShopDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
//RestController는 데이터만 리턴하는 형태이다.
@RestController
@Slf4j
public class AjaxImplController {
    @RequestMapping("getservertime")
    public Object getservertime(){
        Date date = new Date();
        return date.toString();
    }
    @RequestMapping("/checkid")
    public Object checkid(@RequestParam("id") String id){
        String result = "1";
        if (id.equals("qqq")){
            result = "0";
        }
        return result;
    }
    @RequestMapping("/getdatas")
    public Object randoms(){
        String[] topics = {"우주 비행", "요가", "사무실 인테리어", "마술", "피아노 연주", "식물 도감", "로맨틱 여행", "과학 실험", "미스터리 소설", "요리 레시피", "스마트 홈 기술", "사회 문제", "동물 행동학", "웹 개발", "명상과 정신 건강", "전쟁 역사", "패션 디자인", "대화 예절", "친환경 생활", "프로야구", "로봇 공학", "벽화 아트", "여행 경험담", "코믹 스트립", "캠핑과 야외 생활", "머신 러닝 알고리즘", "환경 보호 운동", "새로운 음악 장르", "커피 조각", "극장 연극 공연"};

        List<String> result = new ArrayList<>();
        log.info("-----------------------");
        Random r = new Random();
        int i = 0;
        while(i < 5){
            int num = r.nextInt(30);
            if (!result.contains(topics[num])){
                result.add(topics[num]);
                i++;
            }
        }
        return result;
    }
    @RequestMapping("/getdata")
    public Object shops(){
        List<ShopDto> list = new ArrayList<>();
        list.add(new ShopDto(100, "순댓국", "a.jpg", 37.5547611, 127.0654625));
        list.add(new ShopDto(101, "파스타", "b.jpg", 37.5747611, 127.0554625));
        list.add(new ShopDto(102, "햄버거", "c.jpg", 37.5147611, 127.0154625));
        log.info("-----------------------");
        log.info(list.toString());
        return list;
    }
}
