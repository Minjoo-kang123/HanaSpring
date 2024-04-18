package com.hana.app.repository;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.frame.TestRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MemberRepository extends TestRepository<Integer, MemberDto> {
    public MemberDto selectById(String id) throws Exception;
    public MemberDto findId(String name, String email) throws Exception;
    public MemberDto findPw(String name, String id, String email) throws Exception;
}