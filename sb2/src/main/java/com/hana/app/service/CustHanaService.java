package com.hana.app.service;

import com.hana.app.data.dto.CustDto;
import com.hana.app.frame.HanaDao;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.CustRepository;

import java.util.List;

public class CustHanaService implements HanaService<String, CustDto> {

    HanaDao<String, CustDto> dao;

    public CustHanaService(){

        dao = new CustRepository();
    }


    @Override
    public int add(CustDto custDto) throws Exception {
        System.out.println("Start TR....");
        try {
            dao.insert(custDto);
            System.out.println("COMMIT....");
        }catch(Exception e){
            System.out.println("ROLLBACK....");
            throw e;
        }finally {
            System.out.println("End TR....");
        }

        // SMS ..
        System.out.println("Send SMS ....");
        return 0;
    }

    @Override
    public int del(String s) throws Exception {
        dao.delete(s);
        return 0;
    }

    @Override
    public int modify(CustDto custDto) throws Exception {
        dao.update(custDto);
        return 0;
    }

    @Override
    public CustDto get(String s) throws Exception {
        return dao.select(s);
    }

    @Override
    public List<CustDto> get() throws Exception {
        return dao.select();
    }


}
