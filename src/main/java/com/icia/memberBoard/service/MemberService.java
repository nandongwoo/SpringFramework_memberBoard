package com.icia.memberBoard.service;

import com.icia.memberBoard.dto.MemberDTO;
import com.icia.memberBoard.dto.MemberFileDTO;
import com.icia.memberBoard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MemberService {
@Autowired
private MemberRepository memberRepository;
    public void save(MemberDTO memberDTO) throws IOException {
        if(memberDTO.getMemberProfile().get(0).isEmpty()){
            memberRepository.save(memberDTO);
        } else {
            MemberDTO saveMember = memberRepository.save(memberDTO);
            for(MultipartFile memberFile: memberDTO.getMemberProfile()){
                String originalFileName = memberFile.getOriginalFilename();
                String storedFileName = System.currentTimeMillis() + "-" + originalFileName;

                MemberFileDTO memberFileDTO = new MemberFileDTO();
                memberFileDTO.setOriginalFileName(originalFileName);
                memberFileDTO.setStoredFileName(storedFileName);
                memberFileDTO.setBoardId(saveMember.getId());

                String savePath = "D:\\memberProFile_img\\" + storedFileName;
                memberFile.transferTo(new File(savePath));
                memberRepository.saveFile(memberFileDTO);


            }
        }

    }

    public boolean login(MemberDTO memberDTO) {
        /*
            1. 이메일, 비밀번호 두 값 모두 일치하는 db 조회결과를 가져옴(조회결과 있으면 로그인 성공)
            2. 이메일로 DB에서 조회해서 서비스에서 비밀번호를 서로 비교하여 일치하면 로그인 성공
         */
        MemberDTO dto = memberRepository.login(memberDTO);
        if (dto != null) {
            return true;
        } else {
            return false;
        }
    }


    public List<MemberDTO> list() {
        return memberRepository.list();
    }

    public void delete(Long id) {
        memberRepository.delete(id);
    }

    public MemberDTO findById(Long id){
        return memberRepository.findById(id);
    }
    public List<MemberFileDTO> findMemberProfile(Long boardId){
        return memberRepository.findMemberProfile(boardId);
    }

    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }


    public MemberDTO emailCheck(MemberDTO memberDTO) {
       return memberRepository.emailCheck(memberDTO);
    }
}
