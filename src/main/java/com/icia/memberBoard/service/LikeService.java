package com.icia.memberBoard.service;

import com.icia.memberBoard.dto.LikeDTO;
import com.icia.memberBoard.repository.LikeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class LikeService {
    @Autowired
    private LikeRepository likeRepository;

    public void likeHits(Map<String,Object>likeParam) {
        likeRepository.likeHits(likeParam);
    }

    public LikeDTO findById(Long id){
        return likeRepository.findById(id);
    }

    public void hitsDown(Long commentId) {
        likeRepository.hitsDown(commentId);
    }

    public void hitsUp(Long commentId) {
        likeRepository.hitsUp(commentId);
    }
}
