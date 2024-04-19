package com.hana.controller;

import com.hana.app.data.dto.CompanyQnaDto;
import com.hana.app.data.dto.MemberDto;
import com.hana.app.data.dto.One2OneDto;
import com.hana.app.service.CompanyQnaService;
import com.hana.app.service.One2OneService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/customer")
public class CustomerController {
    final One2OneService one2OneService;
    final CompanyQnaService companyQnaService;
    final static String dir = "customer/";
    @RequestMapping("/customer01")
    public String customer01(Model model, HttpSession session){
        if(session.getAttribute("id") == null) {
            model.addAttribute("location","/member/login");
            model.addAttribute("msg","로그인 후 사용하세요.");
            return "alert";
        }
        model.addAttribute("center", dir + "customer1");
        return "index";
    }

    @RequestMapping("/customer02")
    public String customer02(Model model, HttpSession session) throws Exception {
        if(session.getAttribute("id") == null) {
            model.addAttribute("location","/member/login");
            model.addAttribute("msg","로그인 후 사용하세요.");
            return "alert";
        }
        List<CompanyQnaDto> list = companyQnaService.get();
        model.addAttribute("center", dir + "customer2");
        model.addAttribute("list", list);
        return "index";
    }

    @RequestMapping("/customer02Sc")
    public String customer02sc(Model model, HttpSession session,
                                @RequestParam("keyword") String key, @RequestParam("select") String select) throws Exception {
        if(session.getAttribute("id") == null) {
            model.addAttribute("location","/member/login");
            model.addAttribute("msg","로그인 후 사용하세요.");
            return "alert";
        }
        List<CompanyQnaDto> list = companyQnaService.search(key, select);
        model.addAttribute("center", dir + "customer2");
        model.addAttribute("list", list);
        return "index";
    }
    @RequestMapping("/customer024")
    public String customer024(Model model, HttpSession session, @RequestParam("id") int id) throws Exception {
        log.info("hello");
        if(session.getAttribute("id") == null) {
            model.addAttribute("location","/member/login");
            model.addAttribute("msg","로그인 후 사용하세요.");
            return "alert";
        }
        CompanyQnaDto dto = companyQnaService.get(id);
        model.addAttribute("center", dir + "customer02_4");
        model.addAttribute("data", dto);
        return "index";
    }
    @RequestMapping("/customer03")
    public String customer03(Model model, HttpSession session){
        if(session.getAttribute("id") == null) {
            model.addAttribute("location","/member/login");
            model.addAttribute("msg","로그인 후 사용하세요.");
            return "alert";
        }
        model.addAttribute("center", dir + "customer3");
        return "index";
    }

    @RequestMapping("/one2oneaddimpl")
    public String joinimpl(Model model, One2OneDto one2OneDto){
        try {
            one2OneService.add(one2OneDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("location","/");
        model.addAttribute("msg","1대1 문의가 전송되었습니다.");
        return "alert";
    }
}
