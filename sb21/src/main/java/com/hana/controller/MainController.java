package com.hana.controller;

import com.hana.app.data.dto.BoardDto;
import com.hana.app.data.dto.CustDto;
import com.hana.app.data.dto.LoginCust;
import com.hana.app.repository.LoginCustRepository;
import com.hana.app.service.BoardService;
import com.hana.app.service.CustService;
import com.hana.util.FileUploadUtil;
import com.hana.util.WeatherUtil;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {

    final CustService custService;
    final BoardService boardService;
    final BCryptPasswordEncoder encoder;
    final LoginCustRepository loginCustRepository;

    @Value("${app.key.wkey1}")
    String wkey1;

    @Value("${app.key.wkey2}")
    String wkey2;
    @Value("${app.url.serverurl}")
    String serverurl;
    @Value("${app.dir.upload}")
    String imgdir;

    @RequestMapping("/")
    public String main(Model model) throws Exception {
        List<BoardDto> list = null;
        list = boardService.getRank();
        model.addAttribute("boards", list);
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model){
        model.addAttribute("center","login");
        return "index";
    }
    @RequestMapping("/logoutimpl")
    public String logout(Model model, HttpSession httpSession){
        if(httpSession != null){
            loginCustRepository.deleteById((String) httpSession.getAttribute("id"));
            httpSession.invalidate();
        }
        return "index";
    }
    @RequestMapping("/loginimpl")
    public String loginimpl(Model model,
                            @RequestParam("id") String id,
                            @RequestParam("pwd") String pwd, HttpSession httpSession){
        CustDto custDto = null;
        try {
            custDto = custService.get(id);
            log.info(custDto.toString());
            if(custDto == null){
                throw new Exception();
            }
            if(!encoder.matches(pwd,custDto.getPwd())){
                log.info("로그인실패");
                throw new Exception();
            }
            LoginCust loginCust = LoginCust.builder().loginId(id).build();
            loginCustRepository.save(loginCust);
            httpSession.setAttribute("id", id);
        } catch (Exception e) {
            model.addAttribute("center","login");
            model.addAttribute("msg","ID 또는 PWD가 틀립니다.");
        }
        return "redirect:/";
    }

    @RequestMapping("/registerimpl")
    public String registerimpl(Model model,
                               CustDto custDto, HttpSession httpSession){
        try {
            custDto.setPwd(encoder.encode(custDto.getPwd()));
            log.info(custDto.getPwd());
            custService.add(custDto);
            httpSession.setAttribute("id", custDto.getCustId());
            LoginCust loginCust = LoginCust.builder().loginId(custDto.getCustId()).build();
            loginCustRepository.save(loginCust);
        } catch (Exception e) {
            //throw new RuntimeException(e);
            model.addAttribute("center","/registerfail");
        }
        return "index";
    }
    @RequestMapping("/register")
    public String register(Model model){

        model.addAttribute("center","register");
        return "index";
    }
    @RequestMapping("/chat")
    public String chat(Model model){
        model.addAttribute("serverurl",serverurl);
        model.addAttribute("center","chat");
        return "index";
    }

    @RequestMapping("/chat2")
    public String chat2(Model model){
        model.addAttribute("serverurl",serverurl);
        model.addAttribute("center","chat2");
        return "index";
    }
    @RequestMapping("/pic")
    public String pic(Model model){
        model.addAttribute("center","pic");
        return "index";
    }
    @RequestMapping("/saveimg")
    public String saving(@RequestParam MultipartFile file){
        String imgName = file.getOriginalFilename();
        FileUploadUtil.saveFile(file, imgdir);
        return "index";
    }
    @ResponseBody
    @RequestMapping("/registercheck")
    public Object register(Model model, @RequestParam("id") String id) throws Exception {
        String result = "0";
        CustDto custDto = custService.get(id);
        if (custDto == null) {
            result = "1";
        }
        return result;
    }
    @RequestMapping("/wh")
    @ResponseBody
    public Object wh(Model model) throws IOException, ParseException {
        return WeatherUtil.getWeather("109", wkey1);
    }

    @RequestMapping("/whget")
    @ResponseBody
    public Object wh2(Model model) throws IOException, ParseException {
        return WeatherUtil.getWeather2("1835848", wkey2);
    }
    @RequestMapping("/weather")
    public String weather(Model model){
        model.addAttribute("center","weather");
        return "index";
    }
}