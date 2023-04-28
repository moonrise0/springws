package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Sales {
    private String rdate; //DATE값이라 안썻네?
    private int price;
    private String gender;

}
