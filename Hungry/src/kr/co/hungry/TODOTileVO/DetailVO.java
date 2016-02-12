package kr.co.hungry.TODOTileVO;

public class DetailVO {
	private String detailNo;
	private String detailContent;
	private String subjectNo;
	private int detailChecked;
	
	public String getDetailNo() {
		return detailNo;
	}
	public void setDetailNo(String detailNo) {
		this.detailNo = detailNo;
	}
	public String getDetailContent() {
		return detailContent;
	}
	public void setDetailContent(String detailContent) {
		this.detailContent = detailContent;
	}
	public String getSubjectNo() {
		return subjectNo;
	}
	public void setSubjectNo(String subjectNo) {
		this.subjectNo = subjectNo;
	}
	public int getDetailChecked() {
		return detailChecked;
	}
	public void setDetailChecked(int detailChecked) {
		this.detailChecked = detailChecked;
	}
}
