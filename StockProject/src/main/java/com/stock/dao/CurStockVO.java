package com.stock.dao;

public class CurStockVO {
	private String id;
	private String t ;
	private String e ;
	private String l ;
	private String l_fix;
	private String l_cur;
	private String s;
	private String ltt ;
	private String lt ;
	private String c ;
	private String cp ;
	private String ccol ;
	private String tcolor;

	public String getTcolor() {
		return tcolor;
	}
	public void setTcolor(String tcolor) {
		this.tcolor = tcolor;
	}
	public String getL_fix() {
		return l_fix;
	}
	public void setL_fix(String l_fix) {
		this.l_fix = l_fix;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getT() {
		return t;
	}
	public void setT(String t) {
		this.t = t;
	}
	public String getE() {
		return e;
	}
	public void setE(String e) {
		this.e = e;
	}
	public String getL() {
		return l;
	}
	public void setL(String l) {
		this.l = l;
	}
	public String getL_cur() {
		return l_cur;
	}
	public void setL_cur(String l_cur) {
		this.l_cur = l_cur;
	}
	public String getS() {
		return s;
	}
	public void setS(String s) {
		this.s = s;
	}
	public String getLtt() {
		return ltt;
	}
	public void setLtt(String ltt) {
		this.ltt = ltt;
	}
	public String getLt() {
		return lt;
	}
	public void setLt(String lt) {
		this.lt = lt;
	}
	public String getC() {
		return c;
	}
	public void setC(String c) {
		this.c = c;
	}
	public String getCp() {
		return cp;
	}
	public void setCp(String cp) {
		this.cp = cp;
	}
	public String getCcol() {
		return ccol;
	}
	public void setCcol(String ccol) {
		this.ccol = ccol;
	}
}
