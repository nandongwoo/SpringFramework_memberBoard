package com.icia.memberBoard.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
public class BoardDTO {
    private Long id;
    private String boardTitle;
    private String boardWriter;
    private String boardComment;
    private int boardHits;
    private String createdAt;
    private List<MultipartFile> fileAttached;
}
