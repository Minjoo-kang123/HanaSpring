package com.hana.app.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hana.app.data.dto.CustDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.CustRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor
public class CustService implements HanaService<String, CustDto> {
    //위의 어노테이션을 통해서 final로 선언된 것들은
    //lombok이 자동으로 주입해준다
    final CustRepository custRepository;

    @Override
    public int add(CustDto custDto) throws Exception {
        return custRepository.insert(custDto);
    }

    @Override
    public int del(String s) throws Exception {
        return custRepository.delete(s);
    }

    @Override
    public int modify(CustDto custDto) throws Exception {
        return custRepository.update(custDto);
    }

    @Override
    public CustDto get(String s) throws Exception {
        return custRepository.select(s);
    }

    @Override
    public List<CustDto> get() throws Exception {
        return custRepository.selectAll();
    }

    public Page<CustDto> getPage(int pageNo) throws Exception{
        PageHelper.startPage(pageNo, 3);
        return custRepository.getpage();
    }
}
