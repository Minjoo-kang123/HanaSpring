package com.hana.controller;

import com.hana.app.data.dto.AddrDto;
import com.hana.app.data.dto.CustDto;
import com.hana.app.data.dto.ItemDto;
import com.hana.app.service.AddrService;
import com.hana.app.service.CustService;
import com.hana.app.service.ItemService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/item")
@RequiredArgsConstructor
public class ItemController {
    String dir= "item/";
    final ItemService itemService;

    @RequestMapping("/")
    public String main(Model model){
        List<ItemDto> list = null;
        try {
            list = itemService.get();
            model.addAttribute("items", list);
            model.addAttribute("left", dir+"left");
            model.addAttribute("center",dir+"get");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "index";
    }

    @RequestMapping("/get")
    public String get(Model model){
        List<ItemDto> list = null;
        try {
            list = itemService.get();
            model.addAttribute("items", list);
            model.addAttribute("left", dir+"left");
            model.addAttribute("center",dir+"get");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "index";
    }


    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") int id){
        ItemDto c = null;
        List<AddrDto> addrs = new ArrayList<>();
        try {
            c = itemService.get(id);
            model.addAttribute("left", dir+"left");
            model.addAttribute("center",dir+"detail");
            model.addAttribute("item", c);
        } catch (Exception e) {
            //throw new RuntimeException(e);
            model.addAttribute("left", dir+"left");
            model.addAttribute("center","/registerfail");
            return "index";
        }
        return "index";
    }
}