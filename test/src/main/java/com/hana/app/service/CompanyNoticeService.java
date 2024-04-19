package com.hana.app.service;


import com.hana.app.data.dto.CompanyNoticeDto;
import com.hana.app.data.dto.CompanyQnaDto;
import com.hana.app.data.dto.MemberDto;
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

    public List<CompanyNoticeDto> search(String key, String select) throws Exception {
        switch (select){
            case "title" :
                return companyNoticeRepository.searchTitle(key);
            case "content":
                return companyNoticeRepository.searchContent(key);
            default:
                return null;
        }
    }

    public List<CompanyNoticeDto> getOrderd(String option) throws Exception {
        switch (option){
            case "id_asc":
                return companyNoticeRepository.selectedIdAsc();
            case "id_desc":
                return companyNoticeRepository.selectedIdDesc();
            case "reg_date_asc":
                return companyNoticeRepository.selectedDateAsc();
            case "reg_date_desc":
                return companyNoticeRepository.selectedDateDesc();
        }
        return companyNoticeRepository.selectAll();
    }

    public List<CompanyNoticeDto> searchAll(String keyword) throws Exception {
        return companyNoticeRepository.searchAll(keyword);
    }
    public List<CompanyNoticeDto> searchTitle(String keyword) throws Exception {
        return companyNoticeRepository.searchTitle(keyword);
    }
    public List<CompanyNoticeDto> searchContent(String keyword) throws Exception {
        return companyNoticeRepository.searchContent(keyword);
    }
    public List<CompanyNoticeDto> searchId(String keyword) throws Exception {
        return companyNoticeRepository.searchId(keyword);
    }
}
