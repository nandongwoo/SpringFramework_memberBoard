package com.icia.memberBoard.repository;

//import org.apache.ibatis.session.SqlSessionFactory;
import com.icia.memberBoard.dto.MemberDTO;
import com.icia.memberBoard.dto.MemberFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public MemberDTO save(MemberDTO memberDTO) {
        sql.insert("Member.save", memberDTO);
//      mapper = <insert id="save" parameterType="member" useGeneratedKeys="true" keyProperty="id">
//      일 때 useGeneratedKeys가 true이면 keyProperty값을 바로 가져올 수있다.
//      현재 파일처리를 하기위해 "id"가 필요하기 때문에 id값을 받아옴
        return memberDTO;
    }

    public void saveFile(MemberFileDTO memberFileDTO) {
        sql.insert("Member.saveFile", memberFileDTO);
    }

    public MemberDTO login (MemberDTO memberDTO){
        return sql.selectOne("Member.login", memberDTO);
    }

    public List<MemberDTO> list() {
        return sql.selectList("Member.list");
    }

    public void delete(Long id) {
        sql.delete("Member.delete", id);
    }

    public MemberDTO findById(Long id) {
        return sql.selectOne("Member.findById", id);

    }

    public List<MemberFileDTO> findMemberProfile(Long boardId) {
       return sql.selectList("Member.findFile", boardId);
    }

    public void update(MemberDTO memberDTO) {
        sql.update("Member.update", memberDTO);
    }


    public MemberDTO emailCheck(MemberDTO memberDTO) {
        return sql.selectOne("Member.emailCheck", memberDTO);
    }
}
