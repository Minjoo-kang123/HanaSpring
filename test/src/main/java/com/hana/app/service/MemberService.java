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
    public List<MemberDto> getOrderd(String option) throws Exception {
        switch (option){
            case "id_asc":
                return memberRepository.selectedIdAsc();
            case "id_desc":
                return memberRepository.selectedIdDesc();
            case "join_date_asc":
                return memberRepository.selectedDateAsc();
            case "join_date_desc":
                return memberRepository.selectedDateDesc();
        }
        return memberRepository.selectAll();
    }

    public List<MemberDto> searchAll(String keyword) throws Exception {
        return memberRepository.searchAll(keyword);
    }
    public List<MemberDto> searchCEmail(String keyword) throws Exception {
        return memberRepository.searchCEmail(keyword);
    }
    public List<MemberDto> searchName(String keyword) throws Exception {
        return memberRepository.searchName(keyword);
    }
    public List<MemberDto> searchId(String keyword) throws Exception {
        return memberRepository.searchId(keyword);
    }
}
