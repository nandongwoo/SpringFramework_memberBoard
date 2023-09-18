package com.icia.memberBoard.service;

import com.icia.memberBoard.dto.BoardDTO;
import com.icia.memberBoard.dto.BoardFileDTO;
import com.icia.memberBoard.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;
    public void save(BoardDTO boardDTO) throws IOException {
        if(boardDTO.getBoardFile().get(0).isEmpty()){
            boardDTO.setFileAttached(0);
            System.out.println("boardDTO = " + boardDTO);
            boardRepository.save(boardDTO);
        }else {
            boardDTO.setFileAttached(1);
            System.out.println("boardDTO = " + boardDTO);
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

    public List<BoardDTO> list() {
        return boardRepository.list();
    }

    public BoardDTO findById(Long id) {

        return boardRepository.findById(id);
    }

    public List<BoardFileDTO> boardFile(Long id) {
        return boardRepository.boardFile(id);
    }
}
