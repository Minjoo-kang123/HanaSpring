package com.hana.spring1;

import com.hana.spring1.data.CustDto;
import com.hana.spring1.exception.DuplicatedIdException;
import com.hana.spring1.frame.Service;
import com.hana.spring1.service.CustService;

public class Main {
    public static void main(String[] args) {
        Service<String , CustDto> service =
                new CustService();
        CustDto cust = CustDto.builder().pwd("pwd02").id("id02").name("jamse").build();
        try {
            service.add(cust);
        } catch (DuplicatedIdException e) {
            throw new RuntimeException(e);
        }
        System.out.println("Hello world!");
    }
}