package com.icia.unity.service;

import com.icia.unity.dto.MemberDTO;
import com.icia.unity.dto.MemberProfileDTO;
import com.icia.unity.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class MemberService {
    @Autowired
    MemberRepository memberRepository;
    public void save(MemberDTO memberDTO) throws IOException {
        if (memberDTO.getMemberProfile().isEmpty()) {
            System.out.println("파일없음");
            memberDTO.setMemberProfileAttached(0);
            memberRepository.save(memberDTO);
        } else {
            System.out.println("파일있음");
            memberDTO.setMemberProfileAttached(1);
            MemberDTO dto = memberRepository.save(memberDTO);
            String originalFilename = memberDTO.getMemberProfile().getOriginalFilename();
            String storedFilename = UUID.randomUUID().toString() + "-" + originalFilename;
            MemberProfileDTO memberProfileDTO = new MemberProfileDTO();
            memberProfileDTO.setOriginalFileName(originalFilename);
            memberProfileDTO.setStoredFileName(storedFilename);
            memberProfileDTO.setMemberId(dto.getId());
            String savePath = "C:\\springframework_img\\" + storedFilename;
            memberDTO.getMemberProfile().transferTo(new File(savePath));
            memberRepository.saveFile(memberProfileDTO);
        }
    }

    public MemberDTO findByMemberEmail(String loginEmail) {
        return memberRepository.findByMemberEmail(loginEmail);
    }

    public boolean login(MemberDTO memberDTO) {
        MemberDTO dto = memberRepository.login(memberDTO);
        if (dto != null) {
            return true;
        } else {
            return false;
        }
    }

    public MemberProfileDTO findFile(Long memberId) {
        return memberRepository.findFile(memberId);
    }

    public void update(MemberDTO memberDTO) throws IOException {
        if (memberDTO.getMemberProfile().isEmpty()) {
            memberDTO.setMemberProfileAttached(0);
            memberRepository.update(memberDTO);
        } else {
            memberDTO.setMemberProfileAttached(1);
            MemberDTO dto = memberRepository.update(memberDTO);
            memberRepository.deleteProfile(memberDTO.getId());
            String originalFilename = memberDTO.getMemberProfile().getOriginalFilename();
            String storedFilename = UUID.randomUUID().toString() + "-" + originalFilename;
            MemberProfileDTO memberProfileDTO = new MemberProfileDTO();
            memberProfileDTO.setOriginalFileName(originalFilename);
            memberProfileDTO.setStoredFileName(storedFilename);
            memberProfileDTO.setMemberId(dto.getId());
            memberRepository.saveFile(memberProfileDTO);
            String savePath = "C:\\springframework_img\\" + storedFilename;
            memberDTO.getMemberProfile().transferTo(new File(savePath));
        }
    }

    public List<MemberDTO> findAll() {
        List<MemberDTO> memberDTOList = memberRepository.findAll();
        if (memberDTOList.size() == 0) {
            return null;
        } else {
            return memberDTOList;
        }
    }

}
