package com.leefine.cms.vo;

import org.apache.ibatis.type.Alias;

import com.sanxing.epower.core.vo.BaseVo;

@Alias("AtlInfo")
public class AtlInfo extends BaseVo {
	private String title;
	private String picpath;
	private int pv;
	private String descr;
	private String author;
	private String titlecolor;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPicpath() {
		return picpath;
	}

	public void setPicpath(String picpath) {
		this.picpath = picpath;
	}

	public int getPv() {
		return pv;
	}

	public void setPv(int pv) {
		this.pv = pv;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTitlecolor() {
		return titlecolor;
	}

	public void setTitlecolor(String titlecolor) {
		this.titlecolor = titlecolor;
	}

}
