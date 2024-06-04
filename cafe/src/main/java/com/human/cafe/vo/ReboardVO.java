package com.human.cafe.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ReboardVO {
	private int bno, rno, cnt, goods, level, regroup, nowPage, startRno, endRno, upBno;
	private String id, body, upno, sdate, savename;
	private Date wdate;
	
	public int getUpBno() {
		return upBno;
	}
	public void setUpBno(int upBno) {
		this.upBno = upBno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getGoods() {
		return goods;
	}
	public void setGoods(int goods) {
		this.goods = goods;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getRegroup() {
		return regroup;
	}
	public void setRegroup(int regroup) {
		this.regroup = regroup;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getUpno() {
		return upno;
	}
	public void setUpno(String upno) {
		this.upno = upno;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public void setSdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdate = form.format(wdate);
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
		setSdate();
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartRno() {
		return startRno;
	}
	public void setStartRno(int startRno) {
		this.startRno = startRno;
	}
	public int getEndRno() {
		return endRno;
	}
	public void setEndRno(int endRno) {
		this.endRno = endRno;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	@Override
	public String toString() {
		return "ReboardVO [bno=" + bno + ", rno=" + rno + ", cnt=" + cnt + ", goods=" + goods + ", level=" + level
				+ ", regroup=" + regroup + ", nowPage=" + nowPage + ", startRno=" + startRno + ", endRno=" + endRno
				+ ", upBno=" + upBno + ", id=" + id + ", body=" + body + ", upno=" + upno + ", sdate=" + sdate
				+ ", savename=" + savename + ", wdate=" + wdate + "]";
	}
	
}
