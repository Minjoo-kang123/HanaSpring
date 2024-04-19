package com.hana.app.service;


import com.hana.app.data.dto.AdminMemberDto;
import com.hana.app.data.dto.MemberDto;
import com.hana.app.frame.TestService;
import com.hana.app.repository.AdminMemberRepository;
import com.hana.app.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AdminMemberService implements TestService<Integer, AdminMemberDto> {
    final AdminMemberRepository adminMemberRepository;

    @Override
    public int add(AdminMemberDto adminMemberDto) throws Exception {
        return adminMemberRepository.insert(adminMemberDto);
    }

    @Override
    public int del(Integer integer) throws Exception {
        return adminMemberRepository.delete(integer);
    }

    @Override
    public int modify(AdminMemberDto adminMemberDto) throws Exception {
        return adminMemberRepository.update(adminMemberDto);
    }

    @Override
    public AdminMemberDto get(Integer integer) throws Exception {
        return adminMemberRepository.select(integer);
    }

    @Override
    public List<AdminMemberDto> get() throws Exception {
        return adminMemberRepository.selectAll();
    }
    public AdminMemberDto getById(String id) throws Exception {
        return adminMemberRepository.selectById(id);
    }
}
