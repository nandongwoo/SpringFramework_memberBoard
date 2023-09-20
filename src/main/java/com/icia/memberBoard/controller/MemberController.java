package com.icia.memberBoard.controller;

import com.icia.memberBoard.dto.MemberDTO;
import com.icia.memberBoard.dto.MemberFileDTO;
import com.icia.memberBoard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String save() {
        return "/memberPages/memberSave";
    }

    @PostMapping("/save")
    public String save(MemberDTO memberDTO) throws IOException {
        System.out.println("memberDTO = " + memberDTO);
        memberService.save(memberDTO);
        return "/memberPages/memberLogin";
    }

    @GetMapping("/login")
    public String login() {
        return "/memberPages/memberLogin";

    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession httpSession) {
        MemberDTO memberDTO1 = memberService.login(memberDTO);
        System.out.println(memberDTO1);
        if (memberDTO1!=null) {
                httpSession.setAttribute("loginEmail", memberDTO1.getMemberEmail());
                httpSession.setAttribute("loginId", memberDTO1.getId());
            System.out.println(httpSession.getAttribute("loginId"));
                return "redirect:/board/list";
            }
            return "/memberPages/memberLogin";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loginEmail");
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<MemberDTO> memberDTOList = memberService.list();
        model.addAttribute("memberList", memberDTOList);
        return "/memberPages/memberList";
    }


    @GetMapping("/myPage")
    public String myPage(@RequestParam("id") Long id,
                         Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        List<MemberFileDTO> memberFileDTOList = memberService.findMemberProfile(id);
        model.addAttribute("memberFile", memberFileDTOList);
        System.out.println("memberFileDTOList + memberDTO = " + memberFileDTOList + memberDTO);
        return "/memberPages/memberMyPages";
    }

    @GetMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO,
                         Model model) {
        System.out.println(memberDTO);
        memberService.update(memberDTO);
        model.addAttribute("member", memberDTO);
        return "/memberPages/memberMyPages";
    }

    @GetMapping("/drop")
    public String drop(@RequestParam("id")Long id,
                       Model model){
        memberService.delete(id);
        List<MemberDTO> memberDTOList = memberService.list();
        model.addAttribute("memberList", memberDTOList);
        return "/memberPages/memberList";
    }

    @GetMapping("/delete1")
    public String delete1(@RequestParam("id")Long id,
                         Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member",memberDTO);
        System.out.println(memberDTO);
        return "/memberPages/memberDelete";
    }

    @GetMapping("/delete2")
    public String delete2(@RequestParam("id")Long id){
        memberService.delete(id);
        return "redirect:/";
    }

    @GetMapping("/emailCheck")
    public @ResponseBody MemberDTO emailCheck(MemberDTO memberDTO){
        MemberDTO memberDTO1 = memberService.emailCheck(memberDTO);
        System.out.println("memberDTO = " + memberDTO);
        return memberDTO1;
    }
}
