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
public class CompanyNoticeDto {
    int noticeIdx;
    String noticeTitle;
    String noticeContent;
    String noticeMemberId;
    Date noticeDate;
}
