package com.hana.controller;

import com.github.pagehelper.PageInfo;
import com.hana.app.data.dto.AddrDto;
import com.hana.app.data.dto.CustDto;
import com.hana.app.service.AddrService;
import com.hana.app.service.CustService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cust")
@RequiredArgsConstructor
public class CustController {
    String dir= "cust/";

    final CustService custService;
    final AddrService addrService;
    @RequestMapping("/")
    public String main(Model model){
        model.addAttribute("left", dir+"left");
        model.addAttribute("center",dir+"center");
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("left", dir+"left");
        model.addAttribute("center",dir+"add");
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model, CustDto custDto){
        try {
            System.out.println(custDto.toString());
            custService.add(custDto);
        } catch (Exception e) {
            //throw new RuntimeException(e);
            model.addAttribute("left", dir+"left");
            model.addAttribute("center","/registerfail");
            return "index";
        }
        return "redirect:/cust/detail?id="+custDto.getCustId();
    }

    @RequestMapping("/get")
    public String get(Model model){
        List<CustDto> list = null;
        try {
            list = custService.get();
            model.addAttribute("custs", list);
            model.addAttribute("left", dir+"left");
            model.addAttribute("center",dir+"get");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "index";
    }


    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") String id){
        CustDto c = null;
        List<AddrDto> addrs = new ArrayList<>();
        try {
            c = custService.get(id);
            addrs = addrService.getId(id);

            model.addAttribute("left", dir+"left");
            model.addAttribute("center",dir+"detail");
            model.addAttribute("cust", c);
            model.addAttribute("addrs", addrs);
        } catch (Exception e) {
            //throw new RuntimeException(e);
            model.addAttribute("left", dir+"left");
            model.addAttribute("center","/registerfail");
            return "index";
        }
        return "index";
    }

    @RequestMapping("/allpage")
    public String allpage(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception {
        PageInfo<CustDto> p;
        try {
            p = new PageInfo<>(custService.getPage(pageNo), 5); // 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception("시스템 장애: ER0001");
        }
        model.addAttribute("cpage",p);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"allpage");
        return "index";
    }
}