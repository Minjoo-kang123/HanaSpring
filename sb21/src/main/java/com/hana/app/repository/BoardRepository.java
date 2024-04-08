package com.hana.app.repository;

import com.hana.app.data.dto.BoardDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface BoardRepository extends HanaRepository<Integer, BoardDto> {
    List<BoardDto> selectId(String custId) throws Exception;
    void updateBoardCount(int id) throws Exception;
}
