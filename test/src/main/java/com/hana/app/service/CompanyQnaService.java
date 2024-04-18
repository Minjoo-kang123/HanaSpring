package com.hana.app.service;


import com.hana.app.data.dto.CompanyQnaDto;
import com.hana.app.data.dto.One2OneDto;
import com.hana.app.frame.TestService;
import com.hana.app.repository.CompanyQnaRepository;
import com.hana.app.repository.One2OneRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CompanyQnaService implements TestService<Integer, CompanyQnaDto> {
    final CompanyQnaRepository companyQnaRepository;

    @Override
    public int add(CompanyQnaDto one2OneDto) throws Exception {
        return companyQnaRepository.insert(one2OneDto);
    }

    @Override
    public int del(Integer integer) throws Exception {
        return companyQnaRepository.delete(integer);
    }

    @Override
    public int modify(CompanyQnaDto one2OneDto) throws Exception {
        return companyQnaRepository.update(one2OneDto);
    }

    @Override
    public CompanyQnaDto get(Integer integer) throws Exception {
        return companyQnaRepository.select(integer);
    }

    @Override
    public List<CompanyQnaDto> get() throws Exception {
        return companyQnaRepository.selectAll();
    }
}
