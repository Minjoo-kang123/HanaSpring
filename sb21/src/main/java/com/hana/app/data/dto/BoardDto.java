package com.hana.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardDto {
    private int boardId;
    private String custId;
    private String boardTitle;
    private String boardContent;
    private LocalDate boardRegdate;
    private LocalDate boardUpdate;
    private int boardCnt;
    private int CommentCnt;
    protected List<CommentDto> commentList;
}
