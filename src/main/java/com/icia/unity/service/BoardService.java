package com.icia.unity.service;

import com.icia.unity.dto.BoardDTO;
import com.icia.unity.dto.BoardFileDTO;
import com.icia.unity.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    public void save(BoardDTO boardDTO) throws IOException {
        if (boardDTO.getBoardFile().get(0).isEmpty()) {
            System.out.println("파일없음");
            boardDTO.setFileAttached(0);
            boardRepository.save(boardDTO);
        } else {
            System.out.println("파일있음");
            boardDTO.setFileAttached(1);
            BoardDTO dto = boardRepository.save(boardDTO);
            for (MultipartFile boardFile: boardDTO.getBoardFile()) {
                String originalFileName = boardFile.getOriginalFilename();
                String storedFileName = System.currentTimeMillis() + "-" + originalFileName;
                BoardFileDTO boardFileDTO = new BoardFileDTO();
                boardFileDTO.setOriginalFileName(originalFileName);
                boardFileDTO.setStoredFileName(storedFileName);
                boardFileDTO.setBoardId(dto.getId());
                String savePath = "C:\\springframework_img\\" + storedFileName;
                boardFile.transferTo(new File(savePath));
                boardRepository.saveFile(boardFileDTO);
            }

        }
    }

    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

    public void updateHits(Long id) {
        boardRepository.updateHits(id);
    }

    public BoardDTO findById(Long id) {
        return boardRepository.findById(id);
    }

    public List<BoardFileDTO> findFile(Long id) {
        return boardRepository.findFile(id);
    }

    public void delete(Long id) {
        boardRepository.delete(id);
    }

    public void update(BoardDTO boardDTO) throws IOException {
        if (boardDTO.getBoardFile().get(0).isEmpty()) {
            boardDTO.setFileAttached(0);
            boardRepository.update(boardDTO);
        } else {
            boardDTO.setFileAttached(1);
            BoardDTO dto = boardRepository.update(boardDTO);
            boardRepository.deleteFile(dto.getId());
            for (MultipartFile boardFile: boardDTO.getBoardFile()) {
                String originalFileName = boardFile.getOriginalFilename();
                String storedFileName = System.currentTimeMillis() + "-" + originalFileName;
                BoardFileDTO boardFileDTO = new BoardFileDTO();
                boardFileDTO.setOriginalFileName(originalFileName);
                boardFileDTO.setStoredFileName(storedFileName);
                boardFileDTO.setBoardId(dto.getId());
                String savePath = "C:\\springframework_img\\" + storedFileName;
                boardFile.transferTo(new File(savePath));
                boardRepository.saveFile(boardFileDTO);
            }
        }
    }

}
