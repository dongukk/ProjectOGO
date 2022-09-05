package com.dao.pay;

import org.apache.ibatis.session.SqlSession;

import com.dto.pay.PayDTO;

public class PayDAO {

	public PayDTO selectOrder(SqlSession session, String ordernum) {
		PayDTO dto = session.selectOne("PayMapper.selectOrder",ordernum);
		return dto;
	}
	
	public int COS(SqlSession session, String orderNum) {
		int COS = session.update("PayMapper.ChangeStatus", orderNum);
		return COS;
	}

}
