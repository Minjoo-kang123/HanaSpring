package com.hana.app.repository;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.frame.TestRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MemberRepository extends TestRepository<Integer, MemberDto> {
    public MemberDto selectById(String id) throws Exception;
    public MemberDto findId(String name, String email) throws Exception;
    public MemberDto findPw(String name, String id, String email) throws Exception;
    public List<MemberDto> selectedDateDesc() throws Exception;
    public List<MemberDto> selectedDateAsc() throws Exception;
    public List<MemberDto> selectedIdDesc() throws Exception;
    public List<MemberDto> selectedIdAsc() throws Exception;

    public List<MemberDto> searchAll(String keyword) throws Exception;
    public List<MemberDto> searchCEmail(String keyword) throws Exception;
    public List<MemberDto> searchName(String keyword) throws Exception;
    public List<MemberDto> searchId(String keyword) throws Exception;
}
