package com.dao.classpage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Set;

public class ClassInsertDAO {
	//한 유저가 같은 수업을 두번째 신청한 경우의 insert
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@ogo4_medium?TNS_ADMIN=C:/eclipse/wallet/Wallet_ogo";
	String username = "ADMIN";
	String xxx = "OGOogo1234567";
	
	public ClassInsertDAO() {
		try {
			Class.forName(driver);
			System.out.println("드라이버 로딩 성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

	public int insert(HashMap resultMap) {
		Connection con= null;
		Statement stmt= null;
		ResultSet rs= null;
		int insertResult= 0;
		
		try {
			con= DriverManager.getConnection(url, username, xxx);
			
			String sql= "insert into classorder(";
			Set keys =resultMap.keySet();
			for (Object k : keys) { //컬럼명
				if (resultMap.get(k).equals("1")) {
					sql += k+","; //마지막에 붙는 ","는 제거해야함..
				}
			}
			sql += ") values(";
			String[] schedules=(String[])resultMap.get("schedules");
			for (String str : schedules) { //values
				if (str.length()>1) {
					sql += str+","; //마지막에 붙는 ","는 제거해야함..
				}else {
					sql += "null,";
				}
				
			}
			sql += ")";
			
			System.out.println(sql);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		
		return 0;
	}
	

}
