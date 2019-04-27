package com.bw.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


public class Shop {
	private Integer sid;
	private String photo;
	private String name;
	private String content;
	private Integer price;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date crtime;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date uptime;
	private Integer state;
	private Type type;
	public Shop(Integer sid, String photo, String name, String content, Integer price, Date crtime, Date uptime,
			Integer state, Type type) {
		super();
		this.sid = sid;
		this.photo = photo;
		this.name = name;
		this.content = content;
		this.price = price;
		this.crtime = crtime;
		this.uptime = uptime;
		this.state = state;
		this.type = type;
	}
	public Shop() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Date getCrtime() {
		return crtime;
	}
	public void setCrtime(Date crtime) {
		this.crtime = crtime;
	}
	public Date getUptime() {
		return uptime;
	}
	public void setUptime(Date uptime) {
		this.uptime = uptime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	
}
