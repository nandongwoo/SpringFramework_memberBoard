package com.icia.memberBoard.repository;

import com.icia.memberBoard.dto.BoardDTO;
import com.icia.memberBoard.dto.BoardFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

    public void delete(Long id) {
        sql.delete("Board.delete", id);
    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParams) { //
        return sql.selectList("Board.pagingList", pagingParams);
    }

    public int boardCount() {
        return sql.selectOne("Board.count");
    }

    public List<BoardDTO> searchList(Map<String, Object> searchparam) {
        return sql.selectList("Board.search", searchparam);

    }

    public int boardSearchCount(Map<String, String> pagingParams) {
        return sql.selectOne("Board.searchCount", pagingParams);
    }

    public void updateHits(Long id) {
        sql.update("Board.updateHits", id);
    }
}
