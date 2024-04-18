package com.hana.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CompanyQnaDto {
    int qnaIdx;
    String qnaName;
    String qnaPw;
    String qnaTitle;
    String qnaContent;
    Date qnaDate;
}
