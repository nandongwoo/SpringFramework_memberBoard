package com.icia.memberBoard.dto;

import lombok.Data;

@Data
public class PageDTO {
        private int page; // 전체 페이지
        private int maxPage; // 전체 페이지 갯수
        private int startPage; // 하단에 보여주는 시작 페이지 번호(1, 4, 7, ~~~)
        private int endPage; // 하단에 보여주는 시작 페이지 번호(3, 6, 9, ~~~)
}
