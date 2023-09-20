package com.icia.memberBoard.controller;

import com.icia.memberBoard.dto.LikeDTO;
import com.icia.memberBoard.service.LikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/like")
public class LikeController {
    @Autowired
    private LikeService likeService;

    @GetMapping("/like")
    public @ResponseBody Integer like(@RequestParam("id") Long id,
                                      @RequestParam("isClicked") boolean isClicked,
                                      HttpSession httpSession) {
        Object loginId = httpSession.getAttribute("loginId");
        System.out.println("id = " + id + ", isClicked = " + isClicked + ", httpSession = " + httpSession);
        Long commentId = id;
        Map<String, Object> likeParam = new HashMap<>();
        likeParam.put("commentId", commentId);
        likeParam.put("loginId", loginId);
        LikeDTO likeDTO = likeService.findById(id);
        if (isClicked == false && likeDTO == null) {
            likeService.likeHits(likeParam);
            return 3;
        } else if (isClicked == false && likeDTO != null) {
            likeService.hitsDown(commentId);
            return 1;
        } else if (isClicked) {
            likeService.hitsUp(commentId);
            return 2;
        }
        return 3;
    }
}
