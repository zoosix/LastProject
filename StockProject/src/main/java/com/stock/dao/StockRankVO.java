package com.stock.dao;
/*
 * 검색비율	현재가	전일비	등락률	거래량	시가	고가	저가	PER	ROE
 */
public class StockRankVO {
	private String no;
	private String name;
	private Double searchRate;
	private String now;
	private String compare;
	private String percent;
	private String amount;
	private String price;
	private String high;
	private String low;
	private String per;
	private String roe;
	

	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getSearchRate() {
		return searchRate;
	}
	public void setSearchRate(Double searchRate) {
		this.searchRate = searchRate;
	}
	public String getNow() {
		return now;
	}
	public void setNow(String now) {
		this.now = now;
	}
	public String getCompare() {
		return compare;
	}
	public void setCompare(String compare) {
		this.compare = compare;
	}
	public String getPercent() {
		return percent;
	}
	public void setPercent(String percent) {
		this.percent = percent;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getHigh() {
		return high;
	}
	public void setHigh(String high) {
		this.high = high;
	}
	public String getLow() {
		return low;
	}
	public void setLow(String low) {
		this.low = low;
	}
	public String getPer() {
		return per;
	}
	public void setPer(String per) {
		this.per = per;
	}
	public String getRoe() {
		return roe;
	}
	public void setRoe(String roe) {
		this.roe = roe;
	}
	
}
