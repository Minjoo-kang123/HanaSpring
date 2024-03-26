package com.hana.spring1.repository;

import com.hana.spring1.data.CustDto;
import com.hana.spring1.exception.DuplicatedIdException;
import com.hana.spring1.frame.Dao;

import java.util.List;

public class CustMySQLDao implements Dao<String, CustDto> {
    @Override
    public int insert(CustDto custDto) throws DuplicatedIdException {
        System.out.println("inserted Mysql database......" + custDto);
        return 0;
    }

    @Override
    public int delete(String s) throws Exception {
        return 0;
    }

    @Override
    public int update(CustDto custDto) throws Exception {
        return 0;
    }

    @Override
    public CustDto select(String s) throws Exception {
        return null;
    }

    @Override
    public List<CustDto> select() throws Exception {
        return null;
    }
}
