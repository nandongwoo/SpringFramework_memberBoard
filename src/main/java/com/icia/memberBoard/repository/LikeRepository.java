package com.icia.memberBoard.repository;

import com.icia.memberBoard.dto.LikeDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class LikeRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void likeHits(Map<String,Object> likeParam) {
        sql.insert("Like.insert", likeParam);
    }

    public LikeDTO findById(Long id) {
        return sql.selectOne("Like.findById", id);
    }

    public void hitsDown(Long commentId) {
        sql.update("Like.hitsDown",commentId);
    }

    public void hitsUp(Long commentId) {
        sql.update("Like.hitsUp", commentId);
    }
}
