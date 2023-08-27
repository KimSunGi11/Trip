package com.springproj.biz.user.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userDAO")
public class UserDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	public UserVO getUser(UserVO vo) {
		if (vo.getMEMBER_ID() != null) {
			return mybatis.selectOne("memberDAO.getUser", vo);
		} else {
			return null;
		}
	}

	public void insertMember(UserVO member) {
		mybatis.insert("memberDAO.insertMember", member);
	}

	public void updateMember(UserVO member) {
		mybatis.update("memberDAO.updateMember", member);
	}

	public void deleteMember(String id) {
		mybatis.delete("memberDAO.deleteMember", id);
	}

	public int idChk(String id) throws Exception {
		int result = mybatis.selectOne("memberDAO.idChk", id);
		return result;
	}

	public UserVO findMember(UserVO member) {
		if (member.getMEMBER_ID() != null) {
			return mybatis.selectOne("memberDAO.findChk", member);
		} else {
			return null;
		}
	}
	
}
