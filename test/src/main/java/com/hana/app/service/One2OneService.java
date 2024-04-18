package com.hana.app.service;


import com.hana.app.data.dto.One2OneDto;
import com.hana.app.frame.TestService;
import com.hana.app.repository.MemberRepository;
import com.hana.app.repository.One2OneRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class One2OneService implements TestService<Integer, One2OneDto> {
    final One2OneRepository one2OneRepository;

    @Override
    public int add(One2OneDto one2OneDto) throws Exception {
        return one2OneRepository.insert(one2OneDto);
    }

    @Override
    public int del(Integer integer) throws Exception {
        return one2OneRepository.delete(integer);
    }

    @Override
    public int modify(One2OneDto one2OneDto) throws Exception {
        return one2OneRepository.update(one2OneDto);
    }

    @Override
    public One2OneDto get(Integer integer) throws Exception {
        return one2OneRepository.select(integer);
    }

    @Override
    public List<One2OneDto> get() throws Exception {
        return one2OneRepository.selectAll();
    }
}
