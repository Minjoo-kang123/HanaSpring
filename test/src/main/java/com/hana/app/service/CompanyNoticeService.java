package com.hana.app.service;


import com.hana.app.data.dto.CompanyNoticeDto;
import com.hana.app.data.dto.CompanyQnaDto;
import com.hana.app.frame.TestService;
import com.hana.app.repository.CompanyNoticeRepository;
import com.hana.app.repository.CompanyQnaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CompanyNoticeService implements TestService<Integer, CompanyNoticeDto> {
    final CompanyNoticeRepository companyNoticeRepository;

    @Override
    public int add(CompanyNoticeDto companyNoticeDto) throws Exception {
        return companyNoticeRepository.insert(companyNoticeDto);
    }

    @Override
    public int del(Integer integer) throws Exception {
        return companyNoticeRepository.delete(integer);
    }

    @Override
    public int modify(CompanyNoticeDto companyNoticeDto) throws Exception {
        return companyNoticeRepository.update(companyNoticeDto);
    }

    @Override
    public CompanyNoticeDto get(Integer integer) throws Exception {
        return companyNoticeRepository.select(integer);
    }

    @Override
    public List<CompanyNoticeDto> get() throws Exception {
        return companyNoticeRepository.selectAll();
    }
}
