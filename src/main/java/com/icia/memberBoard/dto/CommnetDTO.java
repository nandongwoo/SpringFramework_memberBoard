package com.icia.memberBoard.dto;

import lombok.Data;

@Data
public class CommnetDTO {
    private Long id;
    private Long boardId;
    private String CommentWriter;
    private String createdAt;

}
