package com.hana.controller;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {

    final MemberService memberService;
    private String dir = "member/" ;
    @RequestMapping("/join")
    public String join(Model model){
        model.addAttribute("center", dir + "join");
        return ("index");
    }

    @RequestMapping("/idFind")
    public String idFind(Model model){
        model.addAttribute("center", dir + "idFind");
        return ("index");
    }@RequestMapping("/passwordFind")
    public String passwordFind(Model model){
        model.addAttribute("center", dir + "passwordFind");
        return ("index");
    }

    @RequestMapping("/idFindimpl")
    public String idFindimpl(Model model, @RequestParam("userName") String name, @RequestParam("userEmail") String email) throws Exception {
        MemberDto memberDto = memberService.findId(name, email);
        if(memberDto == null){
            model.addAttribute("center", dir + "idFind");
            model.addAttribute("msg", "조회되는 정보가 없습니다. 다시시도해주세요");
            return ("index");
        }
        model.addAttribute("center", dir + "result");
        model.addAttribute("msg", "고객님의 아이디는");
        model.addAttribute("result", memberDto.getMemberId());
        return ("index");
    }

    @RequestMapping("/passwordFindimpl")
    public String passwordFindimpl(Model model, @RequestParam("userName") String name,
                               @RequestParam("userID") String id,
                               @RequestParam("userEmail") String email) throws Exception {
        MemberDto memberDto = memberService.findPw(name, id, email);
        if(memberDto == null){
            model.addAttribute("center", dir + "idFind");
            model.addAttribute("msg", "조회되는 정보가 없습니다. 다시시도해주세요");
            return ("index");
        }
        model.addAttribute("center", dir + "result");
        model.addAttribute("msg", "고객님의 비밀번호는");
        model.addAttribute("result", memberDto.getMemberPw());
        return ("index");
    }

    @RequestMapping("/joinimpl")
    public String joinimpl(Model model, MemberDto memberDto){
        try {
            memberService.add(memberDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("location","/member/login");
        model.addAttribute("msg","회원가입 되었습니다.");
        return "alert";
    }

    @ResponseBody
    @RequestMapping("/idcheck")
    public Object register(Model model, @RequestParam("memberId") String id) throws Exception {
        String result = "0";
        MemberDto memberDto = memberService.getById(id);
        if (memberDto == null) {
            result = "1";
        }
        return result;
    }

    @RequestMapping("/login")
    public String login(Model model){
        model.addAttribute("center",dir + "login");
        return "index";
    }
    @RequestMapping("/logoutimpl")
    public String logout(Model model, HttpSession httpSession){
        if(httpSession != null){
            httpSession.invalidate();
        }
        return "redirect:/";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model,
                            @RequestParam("loginID") String id,
                            @RequestParam("loginPW") String pwd, HttpSession httpSession){
        log.info(id + pwd);
        MemberDto memberDto = null;
        try {
            model.addAttribute("location","/member/login");
            model.addAttribute("msg","ID가 틀립니다.");
            memberDto = memberService.getById(id);
            log.info(memberDto.toString());
            if(memberDto == null){
                throw new Exception();
            }
            if(!pwd.equals(memberDto.getMemberPw())){
                model.addAttribute("msg","PWD가 틀립니다.");
                throw new Exception();
            }
            httpSession.setAttribute("id", id);
        } catch (Exception e) {
            return "alert";
        }
        model.addAttribute("location","/");
        model.addAttribute("msg","로그인되었습니다.");
        return "alert";
    }
}
