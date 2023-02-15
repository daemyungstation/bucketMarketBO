package web.batch.model;

public class CounsellMstModel implements java.io.Serializable {

    /**
     * DLCC Order Mst View
     */
    private static final long serialVersionUID = -1985992253144715490L;
    
    private String ordMstIdx;
    private String counsellResult;
    private String updateDate;
    private String regDm;
    private String counsellMemo;
    private String cntrCd;
    private String consno;
    private String actpId;
    private String b2bCd;
    public String getOrdMstIdx() {
        return ordMstIdx;
    }
    public void setOrdMstIdx(String ordMstIdx) {
        this.ordMstIdx = ordMstIdx;
    }
    public String getCounsellResult() {
        return counsellResult;
    }
    public void setCounsellResult(String counsellResult) {
        this.counsellResult = counsellResult;
    }
    public String getUpdateDate() {
        return updateDate;
    }
    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }
    public String getRegDm() {
        return regDm;
    }
    public void setRegDm(String regDm) {
        this.regDm = regDm;
    }
    public String getCounsellMemo() {
        return counsellMemo;
    }
    public void setCounsellMemo(String counsellMemo) {
        this.counsellMemo = counsellMemo;
    }
    public String getCntrCd() {
        return cntrCd;
    }
    public void setCntrCd(String cntrCd) {
        this.cntrCd = cntrCd;
    }
    public String getConsno() {
        return consno;
    }
    public void setConsno(String consno) {
        this.consno = consno;
    }
    public String getActpId() {
        return actpId;
    }
    public void setActpId(String actpId) {
        this.actpId = actpId;
    }
    public String getB2bCd() {
        return b2bCd;
    }
    public void setB2bCd(String b2bCd) {
        this.b2bCd = b2bCd;
    }
    
    
}
