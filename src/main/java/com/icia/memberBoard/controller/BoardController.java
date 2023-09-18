package com.icia.memberBoard.controller;

import com.icia.memberBoard.dto.BoardDTO;
import com.icia.memberBoard.dto.BoardFileDTO;
import com.icia.memberBoard.dto.CommentDTO;
import com.icia.memberBoard.dto.PageDTO;
import com.icia.memberBoard.service.BoardService;
import com.icia.memberBoard.service.CommentService;
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
    @Autowired
    private CommentService commentService;


    @GetMapping("/list")
    public String list(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                       @RequestParam(value = "q", required = false, defaultValue = "") String q,
                       @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
                       Model model) {

        // 검색이든 아니든 필요한 정보 : boardList, paging
        List<BoardDTO> boardDTOList = null;
        PageDTO pageDTO = null;

        // 검색요청인지 아닌지 구분
        if (q.equals("")) {
            // 일반 페이지 요청
            boardDTOList = boardService.pagingList(page);
            pageDTO = boardService.pageNumber(page);
        } else {
            // 검색결과 페이지 요청
            boardDTOList = boardService.searchList(q, type, page);
            pageDTO = boardService.serachPageNumber(q, type, page);

        }

        model.addAttribute("boardList", boardDTOList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("q",q);
        model.addAttribute("type", type);
        model.addAttribute("page", page);
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

        List<CommentDTO> commentDTOList = commentService.findAll(id);
        if (commentDTOList.size() == 0) {
            model.addAttribute("commentList", null);
        } else {
            model.addAttribute("commentList", commentDTOList);
        }

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








