package com.hana.hello.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {
    @RequestMapping("/")
    public String main(Model model){
        String e = "hello";
        List<String> datas = new ArrayList<>();
        datas.add("hello");
        datas.add("pixcel");
        datas.add("world");
        model.addAttribute("hello", e);
        model.addAttribute("datas", datas);
        return "index";
    }
}
