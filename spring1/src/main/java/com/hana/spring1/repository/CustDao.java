package com.hana.spring1.repository;

import com.hana.spring1.data.CustDto;
import com.hana.spring1.exception.DuplicatedIdException;
import com.hana.spring1.frame.Dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class CustDao implements Dao<String, CustDto> {


    @Override
    public int insert(CustDto custDto) throws DuplicatedIdException {
        //System.out.println("Duplicated ID Exception ");
        if(custDto.getId().equals("id01")){
            throw new DuplicatedIdException("EX0001");
        }
        System.out.println("Oracle DB:Inserted ... "+custDto);
        return 0;
    }

    @Override
    public int delete(String s) throws  Exception{
        System.out.println("Oracle DB:Deleted ... "+s);
        return 0;
    }

    @Override
    public int update(CustDto custDto) throws  Exception{
        System.out.println("Oracle DB:Updated ... "+custDto);
        return 0;
    }

    @Override
    public CustDto select(String s) throws  Exception{
        return CustDto.builder().id(s).pwd("pwd01").name("james").build();
    }

    @Override
    public List<CustDto> select() throws  Exception{
        List list = new ArrayList<CustDto>();
        list.add(CustDto.builder().id("id01").pwd("pwd01").name("james").build());
        list.add(CustDto.builder().id("id02").pwd("pwd02").name("james").build());
        list.add(CustDto.builder().id("id03").pwd("pwd03").name("james").build());
        return list;
    }
}
