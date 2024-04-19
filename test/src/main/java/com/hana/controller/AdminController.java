package com.hana.controller;

import com.hana.app.data.dto.AdminMemberDto;
import com.hana.app.data.dto.CompanyNoticeDto;
import com.hana.app.data.dto.MemberDto;
import com.hana.app.service.AdminMemberService;
import com.hana.app.service.CompanyNoticeService;
import com.hana.app.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class AdminController {
    final AdminMemberService adminMemberService;
    final MemberService memberService;
    final CompanyNoticeService companyNoticeService;
    String dir = "admin/";
    @RequestMapping("/admin")
    public String main(Model model, HttpSession session) throws Exception {
        model.addAttribute("center",dir + "admin_login");
        return "index";
    }
    @RequestMapping("/admin/loginimpl")
    public String loginimpl(Model model, AdminMemberDto dto, HttpSession httpSession){
        String id = dto.getMemberId();
        String pwd = dto.getMemberPw();
        AdminMemberDto adminMemberDto = null;
        log.info(id + pwd);
        try {
            model.addAttribute("location","/admin");
            model.addAttribute("msg","ID가 틀립니다.");
            adminMemberDto = adminMemberService.getById(id);
            log.info(adminMemberDto.toString());
            if(adminMemberDto == null){
                throw new Exception();
            }
            if(!pwd.equals(adminMemberDto.getMemberPw())){
                model.addAttribute("msg","PWD가 틀립니다.");
                throw new Exception();
            }
            httpSession.setAttribute("adminid", id);
        } catch (Exception e) {
            return "alert";
        }
        model.addAttribute("location","/admin_member");
        model.addAttribute("msg","로그인되었습니다.");
        return "alert";
    }
    @RequestMapping("/admin_member")
    public String main2(Model model) throws Exception {
        List<MemberDto> list = memberService.get();
        model.addAttribute("center",dir + "admin_member");
        model.addAttribute("list", list);
        return "index";
    }

    @RequestMapping("/admin_notice")
    public String main4(Model model) throws Exception {
        List<CompanyNoticeDto> list = companyNoticeService.get();
        model.addAttribute("center",dir + "admin_notice");
        model.addAttribute("list", list);
        return "index";
    }

    @RequestMapping("/admin_notice_view")
    public String main10(Model model, @RequestParam("idx") int id) throws Exception {
        CompanyNoticeDto dto = companyNoticeService.get(id);
        model.addAttribute("center",dir + "admin_notice_view");
        model.addAttribute("data", dto);
        return "index";
    }

    @RequestMapping("/admin_noticeSc")
    public String customer03(Model model, HttpSession session,
                             @RequestParam("keyword") String keyword, @RequestParam("select") String select) throws Exception {
        List<CompanyNoticeDto> list = companyNoticeService.searchAll(keyword);
        if(select.equals("all"))
            list = companyNoticeService.searchAll(keyword);
        if(select.equals("title"))
            list = companyNoticeService.searchTitle(keyword);
        if(select.equals("content"))
            list = companyNoticeService.searchContent(keyword);
        if(select.equals("id"))
            list = companyNoticeService.searchId(keyword);

        model.addAttribute("center", dir + "admin_notice");
        model.addAttribute("list", list);
        return "index";
    }

    @RequestMapping("/adminSc")
    public String customer04(Model model, HttpSession session,
                             @RequestParam("keyword") String keyword, @RequestParam("select") String select) throws Exception {
        List<MemberDto> list = null;
        if(select.equals("all"))
            list = memberService.searchAll(keyword);
        if(select.equals("name"))
            list = memberService.searchName(keyword);
        if(select.equals("email"))
            list = memberService.searchCEmail(keyword);
        if(select.equals("id"))
            list = memberService.searchId(keyword);

        model.addAttribute("center", dir + "admin_member");
        model.addAttribute("list", list);
        return "index";
    }

    @RequestMapping("/admin_notice_write")
    public String main5(Model model) throws Exception {
        model.addAttribute("center",dir + "admin_notice_write");
        return "index";
    }

    @RequestMapping("/admin_notice_modify")
    public String main6(Model model, CompanyNoticeDto companyNoticeDto) throws Exception {
        log.info(companyNoticeDto.toString());
        companyNoticeService.modify(companyNoticeDto);
        return "redirect:/admin_notice";
    }
    @RequestMapping("/admin_notice/addimpl")
    public String main6(Model model, CompanyNoticeDto companyNoticeDto, HttpSession session) throws Exception {
        String id = (String) session.getAttribute("adminid");
        companyNoticeDto.setNoticeMemberId(id);
        companyNoticeService.add(companyNoticeDto);
        return "redirect:/admin_notice";
    }

    @RequestMapping("/admin_notice/order")
    @ResponseBody
    public Object main4(Model model, @RequestParam("order") String selectedOption) throws Exception {
        List<CompanyNoticeDto> list = companyNoticeService.getOrderd(selectedOption);
        log.info(list.toString());
        return list;
    }

    @RequestMapping("/admin_member/order")
    @ResponseBody
    public Object main3(Model model, @RequestParam("order") String selectedOption) throws Exception {
        List<MemberDto> list = memberService.getOrderd(selectedOption);
        return list;
    }
    @RequestMapping("/admin_notice_delete")
    public Object main23(Model model, @RequestParam("idx") int idx) throws Exception {
        companyNoticeService.del(idx);
        return "redirect:/admin_notice";
    }
}
