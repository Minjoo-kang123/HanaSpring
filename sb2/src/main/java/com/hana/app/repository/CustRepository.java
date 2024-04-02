package com.hana.app.repository;

import com.hana.app.data.dto.CustDto;
import com.hana.app.frame.HanaDao;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Repository
@Mapper
public class CustRepository implements HanaDao<String, CustDto> {

}
