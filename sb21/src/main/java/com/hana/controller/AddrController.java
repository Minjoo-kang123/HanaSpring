package com.hana.controller;

import com.hana.app.data.dto.AddrDto;
import com.hana.app.data.dto.CustDto;
import com.hana.app.service.AddrService;
import com.hana.app.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/addr")
@RequiredArgsConstructor
public class AddrController {
    String dir= "addr/";
    final AddrService addrService;
    @RequestMapping("/")
    public String main(Model model){
        model.addAttribute("left", dir+"left");
        model.addAttribute("center",dir+"center");
        return "index";
    }
    @RequestMapping(    "/add")
    public String add(Model model){
        model.addAttribute("left", dir+"left");
        model.addAttribute("center",dir+"add");
        return "index";
    }
    @RequestMapping(    "/update")
    public String update(Model model, @RequestParam("id") int id){
        try {
            AddrDto addrDto = addrService.get(id);
            model.addAttribute("addr", addrDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("left", dir+"left");
        model.addAttribute("center",dir+"update");
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(HttpSession session, Model model, AddrDto addrDto){
        String custId = (String) session.getAttribute("id");
        try {
            addrDto.setCustId(custId);
            addrService.add(addrDto);
        } catch (Exception e) {
            //throw new RuntimeException(e);
            model.addAttribute("left", dir+"left");
            model.addAttribute("center","/registerfail");
            return "index";
        }
        return "redirect:/cust/detail?id="+custId;
    }

    @RequestMapping(    "/delete")
    public String del(Model model, @RequestParam("id") int id, HttpSession session){
        String custId = (String) session.getAttribute("id");
        try {
            addrService.del(id);
        } catch (Exception e) {
            //throw new RuntimeException(e);
            model.addAttribute("left", dir+"left");
            model.addAttribute("center","/registerfail");
            return "index";
        }
        return "redirect:/cust/detail?id="+custId;
    }

    @RequestMapping(    "/modifyImpl")
    public String modify(Model model, AddrDto addrDto, HttpSession session){
        String custId = (String) session.getAttribute("id");
        try {
            addrService.modify(addrDto);
        } catch (Exception e) {
            //throw new RuntimeException(e);
            model.addAttribute("left", dir+"left");
            model.addAttribute("center","/registerfail");
            return "index";
        }
        return "redirect:/cust/detail?id="+custId;
    }

}