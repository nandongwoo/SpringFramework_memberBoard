package com.icia.memberBoard.dto;

import lombok.Data;
@Data
public class MemberFileDTO {

        private Long id;
        private Long boardId;
        private String originalFileName;
        private String storedFileName;

}
