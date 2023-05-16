package com.icia.unity.controller;

import com.icia.unity.dto.BoardDTO;
import com.icia.unity.dto.BoardFileDTO;
import com.icia.unity.dto.MemberDTO;
import com.icia.unity.service.BoardService;
import com.icia.unity.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("board")
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String saveForm() {
        return "boardPages/boardSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO, HttpSession session) throws IOException {
        System.out.println("boardDTO = " + boardDTO);
        String loginEmail = (String)session.getAttribute("loginEmail");
        MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
        boardDTO.setMemberId(memberDTO.getId());
        boardService.save(boardDTO);
        return "redirect:/board/";
    }

    @GetMapping("/")
    public String findAll(Model model) {
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList", boardDTOList);
        return "boardPages/boardList";
    }

    @GetMapping
    public String findById(@RequestParam("id") Long id, Model model) {
        boardService.updateHits(id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        if (boardDTO.getFileAttached() == 1) {
            List<BoardFileDTO> boardFileDTO = boardService.findFile(id);
            model.addAttribute("boardFileList", boardFileDTO);
        }
        return "boardPages/boardDetail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boardService.delete(id);
        return "redirect:/board/";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id , Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        if (boardDTO.getFileAttached() == 1) {
            List<BoardFileDTO> boardFileDTOList = boardService.findFile(id);
            model.addAttribute("boardFile", boardFileDTOList);
        }
        model.addAttribute("board", boardDTO);
        return "boardPages/boardUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO, Model model) throws IOException {
        boardService.update(boardDTO);
        BoardDTO dto = boardService.findById(boardDTO.getId());
        return "redirect:/board/";
    }

}
