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
public class One2OneDto {
    int one2oneIdx;
    String one2oneName;
    String one2onePhone;
    String one2oneEmail;
    String one2oneAddress;
    String one2oneTitle;
    String one2oneContent;
    Date one2oneDate;
}
