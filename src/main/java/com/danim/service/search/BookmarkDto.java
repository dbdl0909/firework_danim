package com.danim.service.search;

public class BookmarkDto {
	private int bookmarkNo;
	private String bookmarkInfo;
	
	public int getBookmarkNo() {
		return bookmarkNo;
	}
	public void setBookmarkNo(int bookmarkNo) {
		this.bookmarkNo = bookmarkNo;
	}
	public String getBookmarkInfo() {
		return bookmarkInfo;
	}
	public void setBookmarkInfo(String bookmarkInfo) {
		this.bookmarkInfo = bookmarkInfo;
	}
	
	@Override
	public String toString() {
		return "BookmarkDto [bookmarkNo=" + bookmarkNo + ", bookmarkInfo=" + bookmarkInfo + "]";
	}
	
}
