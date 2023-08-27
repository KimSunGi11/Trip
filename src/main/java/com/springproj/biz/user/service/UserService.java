package com.springproj.biz.user.service;

import com.springproj.biz.user.repository.UserVO;

public interface UserService {

	UserVO getUser(UserVO member);

	boolean insertMember(UserVO member);

	void updateMember(UserVO member);

	void deleteMember(String id);

	int idcheckMember(String id) throws Exception;

	UserVO findMember(UserVO member);
}