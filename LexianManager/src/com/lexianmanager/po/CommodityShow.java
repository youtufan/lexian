package com.lexianmanager.po;

public class CommodityShow {
	private String com_no;
	private String com_name;
	private String introduce;
	private String pictureurl;
	private double min_price;
	private double max_price;
	public String getCom_no() {
		return com_no;
	}
	public void setCom_no(String com_no) {
		this.com_no = com_no;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getPictureurl() {
		return pictureurl;
	}
	public void setPictureurl(String pictureurl) {
		this.pictureurl = pictureurl;
	}
	public double getMin_price() {
		return min_price;
	}
	public void setMin_price(double min_price) {
		this.min_price = min_price;
	}
	public double getMax_price() {
		return max_price;
	}
	public void setMax_price(double max_price) {
		this.max_price = max_price;
	}
	@Override
	public String toString() {
		return "CommodityShow [com_no=" + com_no + ", com_name=" + com_name + ", introduce=" + introduce
				+ ", min_price=" + min_price + ", max_price=" + max_price + "]";
	}
	
	
}
