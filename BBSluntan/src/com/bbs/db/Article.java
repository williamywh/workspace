package com.bbs.db;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class Article {
	private int id;
	private int pid; //private Article parent
	private int rootId;
	private String title;
	private String cont;
	private Date pdate;
	private boolean isLeaf;
	private int grade;
	private String user;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getRootId() {
		return rootId;
	}
	public void setRootId(int rootId) {
		this.rootId = rootId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public boolean isLeaf() {
		return isLeaf;
	}
	public void setLeaf(boolean isLeaf) {
		this.isLeaf = isLeaf;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getUser(){
		return user;
	}
	public void setUser(String user){
		this.user = user;
	}
	public void initFromRs(ResultSet rs) {
		try {
			setId(rs.getInt("id"));
			setPid(rs.getInt("pid"));
			setRootId(rs.getInt("rootid"));
			setTitle(rs.getString("title"));
			setLeaf(rs.getInt("isleaf") == 0 ? true : false);
			setPdate(rs.getTimestamp("pdate"));
			setCont(rs.getString("cont"));
			setUser(rs.getString("username"));//增加
			//setGrade(0);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
