package com.dao.pay;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dto.login.MemberDTO;
import com.dto.pay.PayDTO;

public class PayDAO {

	public PayDTO selectOrder(SqlSession session, String ordernum) {
		PayDTO dto= session.selectOne("PayMapper.selectOrder",ordernum);
		System.out.println("\n selectOrder :"+dto);
		return dto;
	}
	
	
	

	
	public int COS(SqlSession session, String orderNum) {
		int COS = session.update("PayMapper.ChangeStatus", orderNum);
		return COS;
	}

	public List<PayDTO> getPaylist(SqlSession session, String userId) {
		List<PayDTO> list = session.selectList("getPaylist",userId);
		System.out.println(list);
		System.out.println("getpaylist :" +list); 
		return list;
	}



}
