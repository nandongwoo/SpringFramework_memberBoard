package com.icia.memberBoard.controller;

import com.icia.memberBoard.dto.BoardDTO;
import com.icia.memberBoard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;


    @GetMapping("/list")
    public String list(){
        return "/boardPages/boardList";
    }

    @GetMapping("/save")
    public String save(){
        return "/boardPages/boardSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO, HttpSession httpSession) throws IOException {
        Object a = httpSession.getAttribute("loginId");
        boardDTO.setMemberId((Long)a);
        boardService.save(boardDTO);

        return "/boardPages/boardList";
    }

}
