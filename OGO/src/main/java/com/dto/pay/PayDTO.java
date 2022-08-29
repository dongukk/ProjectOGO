package com.dto.pay;

public class PayDTO {
	int ORDERNUM;
	String USERID;
	int CLASSNUM;
	int PRICE;
	String ORDERDATE;
	
	String ORDERSTATUS;
	String SCHEDULE1;
	String SCHEDULE2;
	String SCHEDULE3;
	String SCHEDULE4;
	
	String SCHEDULE5;
	String SCHEDULE6;
	String SCHEDULE7;
	String SCHEDULE8;
	String SCHEDULE9;
	
	String SCHEDULE10;
	String PLACE;
	String CLASSNAME;
	String USERNAME;
	
	
	
	public PayDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PayDTO(int oRDERNUM, String uSERID, int cLASSNUM, int pRICE, String oRDERDATE, String oRDERSTATUS,
			String sCHEDULE1, String sCHEDULE2, String sCHEDULE3, String sCHEDULE4, String sCHEDULE5, String sCHEDULE6,
			String sCHEDULE7, String sCHEDULE8, String sCHEDULE9, String sCHEDULE10, String pLACE, String cLASSNAME,
			String uSERNAME) {
		super();
		ORDERNUM = oRDERNUM;
		USERID = uSERID;
		CLASSNUM = cLASSNUM;
		PRICE = pRICE;
		ORDERDATE = oRDERDATE;
		ORDERSTATUS = oRDERSTATUS;
		SCHEDULE1 = sCHEDULE1;
		SCHEDULE2 = sCHEDULE2;
		SCHEDULE3 = sCHEDULE3;
		SCHEDULE4 = sCHEDULE4;
		SCHEDULE5 = sCHEDULE5;
		SCHEDULE6 = sCHEDULE6;
		SCHEDULE7 = sCHEDULE7;
		SCHEDULE8 = sCHEDULE8;
		SCHEDULE9 = sCHEDULE9;
		SCHEDULE10 = sCHEDULE10;
		PLACE = pLACE;
		CLASSNAME = cLASSNAME;
		USERNAME = uSERNAME;
	}
	@Override
	public String toString() {
		return "PayDTO [ORDERNUM=" + ORDERNUM + ", USERID=" + USERID + ", CLASSNUM=" + CLASSNUM + ", PRICE=" + PRICE
				+ ", ORDERDATE=" + ORDERDATE + ", ORDERSTATUS=" + ORDERSTATUS + ", SCHEDULE1=" + SCHEDULE1
				+ ", SCHEDULE2=" + SCHEDULE2 + ", SCHEDULE3=" + SCHEDULE3 + ", SCHEDULE4=" + SCHEDULE4 + ", SCHEDULE5="
				+ SCHEDULE5 + ", SCHEDULE6=" + SCHEDULE6 + ", SCHEDULE7=" + SCHEDULE7 + ", SCHEDULE8=" + SCHEDULE8
				+ ", SCHEDULE9=" + SCHEDULE9 + ", SCHEDULE10=" + SCHEDULE10 + ", PLACE=" + PLACE + ", CLASSNAME="
				+ CLASSNAME + ", USERNAME=" + USERNAME + "]";
	}
	public int getORDERNUM() {
		return ORDERNUM;
	}
	public void setORDERNUM(int oRDERNUM) {
		ORDERNUM = oRDERNUM;
	}
	public String getUSERID() {
		return USERID;
	}
	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}
	public int getCLASSNUM() {
		return CLASSNUM;
	}
	public void setCLASSNUM(int cLASSNUM) {
		CLASSNUM = cLASSNUM;
	}
	public int getPRICE() {
		return PRICE;
	}
	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}
	public String getORDERDATE() {
		return ORDERDATE;
	}
	public void setORDERDATE(String oRDERDATE) {
		ORDERDATE = oRDERDATE;
	}
	public String getORDERSTATUS() {
		return ORDERSTATUS;
	}
	public void setORDERSTATUS(String oRDERSTATUS) {
		ORDERSTATUS = oRDERSTATUS;
	}
	public String getSCHEDULE1() {
		return SCHEDULE1;
	}
	public void setSCHEDULE1(String sCHEDULE1) {
		SCHEDULE1 = sCHEDULE1;
	}
	public String getSCHEDULE2() {
		return SCHEDULE2;
	}
	public void setSCHEDULE2(String sCHEDULE2) {
		SCHEDULE2 = sCHEDULE2;
	}
	public String getSCHEDULE3() {
		return SCHEDULE3;
	}
	public void setSCHEDULE3(String sCHEDULE3) {
		SCHEDULE3 = sCHEDULE3;
	}
	public String getSCHEDULE4() {
		return SCHEDULE4;
	}
	public void setSCHEDULE4(String sCHEDULE4) {
		SCHEDULE4 = sCHEDULE4;
	}
	public String getSCHEDULE5() {
		return SCHEDULE5;
	}
	public void setSCHEDULE5(String sCHEDULE5) {
		SCHEDULE5 = sCHEDULE5;
	}
	public String getSCHEDULE6() {
		return SCHEDULE6;
	}
	public void setSCHEDULE6(String sCHEDULE6) {
		SCHEDULE6 = sCHEDULE6;
	}
	public String getSCHEDULE7() {
		return SCHEDULE7;
	}
	public void setSCHEDULE7(String sCHEDULE7) {
		SCHEDULE7 = sCHEDULE7;
	}
	public String getSCHEDULE8() {
		return SCHEDULE8;
	}
	public void setSCHEDULE8(String sCHEDULE8) {
		SCHEDULE8 = sCHEDULE8;
	}
	public String getSCHEDULE9() {
		return SCHEDULE9;
	}
	public void setSCHEDULE9(String sCHEDULE9) {
		SCHEDULE9 = sCHEDULE9;
	}
	public String getSCHEDULE10() {
		return SCHEDULE10;
	}
	public void setSCHEDULE10(String sCHEDULE10) {
		SCHEDULE10 = sCHEDULE10;
	}
	public String getPLACE() {
		return PLACE;
	}
	public void setPLACE(String pLACE) {
		PLACE = pLACE;
	}
	public String getCLASSNAME() {
		return CLASSNAME;
	}
	public void setCLASSNAME(String cLASSNAME) {
		CLASSNAME = cLASSNAME;
	}
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}
	
	
	
	
}
