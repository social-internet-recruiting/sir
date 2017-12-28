package net.sns.model;

import java.sql.*;

public class SNSDTO {
	
	private int idx;
	private String img;
	private String contents;
	private String comments;
	private String hashtag;
	private int replycount;
	private int likecount;
	private String auth;
	private Timestamp time;
	
	// 실제 db에는 없는 값, join 해서 가져올것
	// (myinfo에서 사진 변경하면 authimg 변경을 하면 변경되는 로직이 필요함 따라서 이렇게 하는게 더 좋음)
	private String authimg;
	
	public String getAuthimg() {
		return authimg;
	}
	public void setAuthimg(String authimg) {
		this.authimg = authimg;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public int getReplycount() {
		return replycount;
	}
	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	
}
