package com.hana.app.repository;

import com.hana.app.data.dto.CompanyNoticeDto;
import com.hana.app.data.dto.MemberDto;
import com.hana.app.data.dto.One2OneDto;
import com.hana.app.frame.TestRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CompanyNoticeRepository extends TestRepository<Integer, CompanyNoticeDto> {
    List<CompanyNoticeDto> searchTitle(String key) throws Exception;
    List<CompanyNoticeDto> searchContent(String key) throws Exception;
    List<CompanyNoticeDto> searchId(String key) throws Exception;
    List<CompanyNoticeDto> searchAll(String key) throws Exception;
    public List<CompanyNoticeDto> selectedDateDesc() throws Exception;
    public List<CompanyNoticeDto> selectedDateAsc() throws Exception;
    public List<CompanyNoticeDto> selectedIdDesc() throws Exception;
    public List<CompanyNoticeDto> selectedIdAsc() throws Exception;
}
