package com.dao.classpage;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.classpage.ClassDTO;
import com.dto.classpage.ClassImgDTO;

public class ClassDAO {

	public ClassDTO selectClass(SqlSession session, int classNum) {
		ClassDTO dto =session.selectOne("ClassMapper.selectClass", classNum);
		return dto;
	}

	public String selectNickName(SqlSession session, String tutorId) {
		String name =session.selectOne("ClassMapper.selectNickName", tutorId);
		return name;
	}

	public int classOpen(SqlSession session, ClassDTO cDTO) {
		int num =session.insert("ClassMapper.classOpen", cDTO);
		return num;
	}

	public int searchClassNum(SqlSession session, HashMap<String, String> map) {
		int classNum= session.selectOne("ClassMapper.searchClassNum", map);
		return classNum;
	}

	public ClassImgDTO getImage(SqlSession session, int classNum) {
		ClassImgDTO imgDTO= session.selectOne("ClassMapper.getImage", classNum);
		return imgDTO;
	}

	public int searchClassName(SqlSession session, HashMap<String, Object> map) {
		int num= session.selectOne("ClassMapper.searchClassName", map);
		return num;
	}

	public String getTintroduce(SqlSession session, String userId) {
		String tintroduce= session.selectOne("ClassMapper.getTintroduce", userId);
		return tintroduce;
	}

	public String userProfilePhoto(SqlSession session, String tuterId) {
		String tutorProfile= session.selectOne("ClassMapper.userProfilePhoto", tuterId);
		return tutorProfile;
	}

	public int tutorSearch(SqlSession session, String tutorId) {
		int num =session.selectOne("ClassMapper.tutorSearch", tutorId);
		return num;
	}

//	public String selectClass(SqlSession session, String classId) {
//		String con_class = session.selectOne("ClassMapper.selectClass", classId);
//		return con_class;
//	}

}
