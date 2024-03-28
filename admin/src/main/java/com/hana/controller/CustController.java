package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cust")
public class CustController {

    String dir = "cust/";
    @RequestMapping("/get")
    public String get(Model model){
        List<CustDto> list = new ArrayList<>();
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id01", "pwd01", "james"));

        model.addAttribute("center", dir + "get");
        model.addAttribute("data", list);
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir + "add");
        return "index";
    }
}
