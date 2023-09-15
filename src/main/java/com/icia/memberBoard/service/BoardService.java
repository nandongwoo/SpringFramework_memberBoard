package com.icia.memberBoard.service;

import com.icia.memberBoard.dto.BoardDTO;
import com.icia.memberBoard.dto.BoardFileDTO;
import com.icia.memberBoard.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;
    public void save(BoardDTO boardDTO) throws IOException {
        if(boardDTO.getBoardFile().get(0).isEmpty()){
            boardDTO.setFileAttached(0);
            boardRepository.save(boardDTO);
        }else {
            boardDTO.setFileAttached(1);
            BoardDTO saveFile = boardRepository.save(boardDTO);
            for (MultipartFile boardFile : boardDTO.getBoardFile()){
                String originalFileName = boardFile.getOriginalFilename();
                String storedFileName = System.currentTimeMillis() + "-" + originalFileName;

                BoardFileDTO boardFileDTO = new BoardFileDTO();
                boardFileDTO.setOriginalFileName(originalFileName);
                boardFileDTO.setStoredFileName(storedFileName);
                boardFileDTO.setBoardId(saveFile.getId());


                String savePath = "D:\\boardFile_img\\" + storedFileName;
                boardFile.transferTo(new File(savePath));
                boardRepository.saveFile(boardFileDTO);

            }



        }
    }
}
