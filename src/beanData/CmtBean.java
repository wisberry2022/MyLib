package beanData;

import java.util.Date;

public class CmtBean {
	private int bbs_num;
	private int num;
	private String author;
	private Date writeDate;
	private String content;
	
	public int getBbs_num() {
		return bbs_num;
	}
	public void setBbs_num(int bbs_num) {
		this.bbs_num = bbs_num;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
