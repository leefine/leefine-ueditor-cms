package com.leefine.cms.vo;

import org.apache.ibatis.type.Alias;

import com.sanxing.epower.core.vo.BaseVo;

@Alias("AtlCat")
public class AtlCat extends BaseVo {
	private int pid;
	private String name;
	private int status;
	private String descr;
	private int ifmainmenu;
	private int pagetype;

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public int getIfmainmenu() {
		return ifmainmenu;
	}

	public void setIfmainmenu(int ifmainmenu) {
		this.ifmainmenu = ifmainmenu;
	}


	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}
}
