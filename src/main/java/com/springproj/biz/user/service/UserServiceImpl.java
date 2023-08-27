package com.springproj.biz.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springproj.biz.user.repository.UserDAO;
import com.springproj.biz.user.repository.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;

	public UserVO getUser(UserVO member) {// 수정해서 로그인할때 사용할 예정
		return userDAO.getUser(member);
	}

	public boolean insertMember(UserVO member) {
		userDAO.insertMember(member);
		return true;
	}

	public void updateMember(UserVO member) {
		userDAO.updateMember(member);
	}

	public void deleteMember(String id) {
		userDAO.deleteMember(id);
	}

	public int idcheckMember(String id) throws Exception {
		return userDAO.idChk(id);
	}

	public UserVO findMember(UserVO member) {
		return userDAO.findMember(member);
	}
	
}
