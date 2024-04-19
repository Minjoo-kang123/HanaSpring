package com.hana.app.repository;

import com.hana.app.data.dto.CompanyNoticeDto;
import com.hana.app.data.dto.CompanyQnaDto;
import com.hana.app.data.dto.One2OneDto;
import com.hana.app.frame.TestRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CompanyQnaRepository extends TestRepository<Integer, CompanyQnaDto> {
    List<CompanyQnaDto> searchTitle(String key) throws Exception;
    List<CompanyQnaDto> searchContent(String key) throws Exception;
    List<CompanyQnaDto> searchWriter(String key) throws Exception;
}
