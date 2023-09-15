package com.icia.memberBoard.service;

import com.icia.memberBoard.dto.MemberDTO;
import com.icia.memberBoard.dto.MemberFileDTO;
import com.icia.memberBoard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

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

                String savePath = "D:\\memberBoard_img\\" + storedFileName;
                memberFile.transferTo(new File(savePath));
                memberRepository.saveFile(memberFileDTO);


            }
        }

    }

    public MemberDTO login(MemberDTO memberDTO){
        return memberRepository.login(memberDTO);
    }



}
