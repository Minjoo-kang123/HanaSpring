package com.hana.app.service;


import com.hana.app.data.dto.MemberDto;
import com.hana.app.frame.TestService;
import com.hana.app.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService implements TestService<Integer, MemberDto> {
    final MemberRepository memberRepository;

    @Override
    public int add(MemberDto memberDto) throws Exception {
        return memberRepository.insert(memberDto);
    }

    @Override
    public int del(Integer integer) throws Exception {
        return memberRepository.delete(integer);
    }

    @Override
    public int modify(MemberDto memberDto) throws Exception {
        return memberRepository.update(memberDto);
    }

    @Override
    public MemberDto get(Integer integer) throws Exception {
        return memberRepository.select(integer);
    }

    @Override
    public List<MemberDto> get() throws Exception {
        return memberRepository.selectAll();
    }

    public MemberDto getById(String id) throws Exception {
        return memberRepository.selectById(id);
    }
    public MemberDto findId(String name, String email) throws Exception {
        return memberRepository.findId(name, email);
    }
    public MemberDto findPw(String name, String id, String email) throws Exception {
        return memberRepository.findPw(name, id, email);
    }
}
