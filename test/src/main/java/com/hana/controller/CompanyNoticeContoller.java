package com.hana.controller;

import com.hana.app.data.dto.CompanyNoticeDto;
import com.hana.app.data.dto.CompanyQnaDto;
import com.hana.app.service.CompanyNoticeService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/community")
public class CompanyNoticeContoller {
    final static String dir = "community/";
    final CompanyNoticeService companyNoticeService;
    @RequestMapping("/community01")
    public String customer02(Model model, HttpSession session) throws Exception {
        List<CompanyNoticeDto> list = companyNoticeService.get();
        model.addAttribute("center", dir + "comunity01");
        model.addAttribute("list", list);
        return "index";
    }
    @RequestMapping("/community01_1")
    public String customer024(Model model, HttpSession session, @RequestParam("id") int id) throws Exception {
        log.info("hello");
        CompanyNoticeDto dto = companyNoticeService.get(id);
        model.addAttribute("center", dir + "community01_1");
        model.addAttribute("data", dto);
        return "index";
    }
}