package com.icia.unity.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberProfileDTO {
    private Long id;
    private String originalFileName;
    private String storedFileName;
    private Long memberId;
}
