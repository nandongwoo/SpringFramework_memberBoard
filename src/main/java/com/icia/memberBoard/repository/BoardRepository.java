package com.icia.memberBoard.repository;

import com.icia.memberBoard.dto.BoardDTO;
import com.icia.memberBoard.dto.BoardFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;


    public BoardDTO save(BoardDTO boardDTO){
        sql.insert("Board.save", boardDTO);
        return boardDTO;
    }

    public void saveFile(BoardFileDTO boardFileDTO) {
        sql.insert("Board.saveFile", boardFileDTO);

    }

    public List<BoardDTO> list() {
        return sql.selectList("Board.list");
    }

    public BoardDTO findById(Long id) {
        return sql.selectOne("Board.findById", id);
    }

    public List<BoardFileDTO> boardFile(Long boardId) {
        return sql.selectList("Board.findFile", boardId);
    }

//    public void boardUpdateFile(BoardFileDTO boardFileDTO){
//        sql.update("Board.updateFile", boardFileDTO);
//    }

    public BoardDTO update(BoardDTO boardDTO) {
        sql.update("Board.update", boardDTO);
        return boardDTO;
    }
}
