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
public class MemberDto {
    int memberIdx;
    String memberId;
    String memberPw;
    String memberName;
    String memberEmail;
    int memberEmailReceive;
    int memberPwQuestion;
    String memberPwAnswer;
    String memberGender;
    String memberBirthDate;
    Date memberJoinDate;
}
