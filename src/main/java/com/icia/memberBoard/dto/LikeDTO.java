package com.icia.memberBoard.dto;

import lombok.Data;

@Data
public class LikeDTO {
    private Long id;
    private Long memberId;
    private Long commentId;
    private int heart;
    private int dLike;
}


