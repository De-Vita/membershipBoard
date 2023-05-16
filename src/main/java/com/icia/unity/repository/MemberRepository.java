package com.icia.unity.repository;

import com.icia.unity.dto.MemberDTO;
import com.icia.unity.dto.MemberProfileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public MemberDTO save(MemberDTO memberDTO) {
        System.out.println("insert 전 = " + memberDTO);
        sql.insert("Member.save", memberDTO);
        System.out.println("insert 후 = " + memberDTO);
        return memberDTO;
    }

    public void saveFile(MemberProfileDTO memberProfileDTO) {
        sql.insert("Member.saveFile", memberProfileDTO);
    }

    public MemberDTO findByMemberEmail(String loginEmail) {
        return sql.selectOne("Member.findByMemberEmail", loginEmail);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }

}
