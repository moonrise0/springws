package com.kbstar.dto;


import lombok.*;

import java.util.Date;

//롬복사용
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Adm {
    private String id;
    private String pwd;
    private int lev;

}
