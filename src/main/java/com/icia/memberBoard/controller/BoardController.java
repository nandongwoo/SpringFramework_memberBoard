package com.icia.memberBoard.controller;

import com.icia.memberBoard.dto.BoardDTO;
import com.icia.memberBoard.dto.BoardFileDTO;
import com.icia.memberBoard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    public String list(Model model) {
        List<BoardDTO> boardDTOList = boardService.list();
        model.addAttribute("boardList", boardDTOList);
        return "/boardPages/boardList";
    }

    @GetMapping("/save")
    public String save() {
        return "/boardPages/boardSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO, HttpSession httpSession) throws IOException {
        Object a = httpSession.getAttribute("loginId");
        boardDTO.setMemberId((Long) a);
        boardService.save(boardDTO);

        return "redirect:/board/list";
    }

    @GetMapping("/detail")
    public String detail(
            @RequestParam("id") Long id,
            Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        if (boardDTO.getFileAttached() == 1) {
            List<BoardFileDTO> boardFileDTOList = boardService.boardFile(id);
            model.addAttribute("boardFile", boardFileDTOList);
        }
        return"/boardPages/boardDetail";
    }



    @GetMapping("/update")
    public String update(@RequestParam("id")Long id,
                         Model model) {
        System.out.println("id = " + id + ", model = " + model);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("update", boardDTO);
        return "/boardPages/boardUpdate";
    }


    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO, Model model) throws IOException {
        boardService.update(boardDTO);
        BoardDTO boardDTO1 = boardService.findById(boardDTO.getId());
        model.addAttribute("board", boardDTO1);
        return "/boardPages/boardDetail";
    }


    @GetMapping("/delete")
    public String delete(@RequestParam("id")Long id,
                         Model model){
        boardService.delete(id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "redirect:/board/list";
    }





}








