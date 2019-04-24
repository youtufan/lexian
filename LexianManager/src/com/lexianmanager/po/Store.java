package com.lexianmanager.po;


public class Store {
	private int sto_id;
	private String sto_no;
	private String sto_name;
	private String sto_add;
	private String sto_intro;
	private String starttime;
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getClosetime() {
		return closetime;
	}
	public void setClosetime(String closetime) {
		this.closetime = closetime;
	}
	private String closetime;
	private int sto_states;
	public int getSto_id() {
		return sto_id;
	}
	public void setSto_id(int sto_id) {
		this.sto_id = sto_id;
	}
	public String getSto_no() {
		return sto_no;
	}
	public void setSto_no(String sto_no) {
		this.sto_no = sto_no;
	}
	public String getSto_name() {
		return sto_name;
	}
	public void setSto_name(String sto_name) {
		this.sto_name = sto_name;
	}
	public String getSto_add() {
		return sto_add;
	}
	public void setSto_add(String sto_add) {
		this.sto_add = sto_add;
	}
	public String getSto_intro() {
		return sto_intro;
	}
	public void setSto_intro(String sto_intro) {
		this.sto_intro = sto_intro;
	}
	
	public int getSto_states() {
		return sto_states;
	}
	public void setSto_states(int sto_states) {
		this.sto_states = sto_states;
	}
}
