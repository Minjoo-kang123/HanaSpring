package com.hana.app.data.dto;

import lombok.*;

@Data
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ShopDto {
    int target;
    String title;
    String img;
    double lat;
    double lng;
}
