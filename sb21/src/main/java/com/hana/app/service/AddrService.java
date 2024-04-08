package com.hana.app.service;

import com.hana.app.data.dto.AddrDto;
import com.hana.app.data.dto.AddrDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.AddrRepository;
import com.hana.app.repository.ItemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AddrService implements HanaService<Integer, AddrDto> {
    final AddrRepository addrRepository;
    @Override
    public int add(AddrDto addrDto) throws Exception {
        return addrRepository.insert(addrDto);
    }

    @Override
    public int del(Integer integer) throws Exception {
        return addrRepository.delete(integer);
    }

    @Override
    public int modify(AddrDto addrDto) throws Exception {
        return addrRepository.update(addrDto);
    }

    @Override
    public AddrDto get(Integer integer) throws Exception {
        return addrRepository.select(integer);
    }

    @Override
    public List<AddrDto> get() throws Exception {
        return addrRepository.selectAll();
    }

    public List<AddrDto> getId(String custId) throws Exception {
        return addrRepository.selectId(custId);
    }
}
