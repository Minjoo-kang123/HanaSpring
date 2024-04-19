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
public class AdminMemberDto {
    int memberIdx;
    String memberId;
    String memberPw;
    String memberName;
    String memberEmail;
    Date memberJoinDate;
}
