package web.batch.model;

public class RmtBasicModel implements java.io.Serializable {
    
    /**
     * 레디플레너 정산 기초 정보
     */
    private static final long serialVersionUID = 6385609356568095752L;
    
    private String prodCd;
    private String saleType;
    private String saleTypeNm;
    private String b2bCompCd;
    private String b2bCompNm;
    private Integer amt;
    private Integer payNo;
    private Integer payNoEnd;
    private String prodJoinDtStr;
    private String prodJoinDtEnd;
    private String rmtBasicRegDt;
    private String rmtBasicUpdDt;
    
    public String getProdCd() {
        return prodCd;
    }
    public void setProdCd(String prodCd) {
        this.prodCd = prodCd;
    }
    public String getSaleType() {
        return saleType;
    }
    public void setSaleType(String saleType) {
        this.saleType = saleType;
    }
    public String getSaleTypeNm() {
        return saleTypeNm;
    }
    public void setSaleTypeNm(String saleTypeNm) {
        this.saleTypeNm = saleTypeNm;
    }
    public String getB2bCompCd() {
        return b2bCompCd;
    }
    public void setB2bCompCd(String b2bCompCd) {
        this.b2bCompCd = b2bCompCd;
    }
    public String getB2bCompNm() {
        return b2bCompNm;
    }
    public void setB2bCompNm(String b2bCompNm) {
        this.b2bCompNm = b2bCompNm;
    }
    public Integer getAmt() {
        return amt;
    }
    public void setAmt(Integer amt) {
        this.amt = amt;
    }
    public Integer getPayNo() {
        return payNo;
    }
    public void setPayNo(Integer payNo) {
        this.payNo = payNo;
    }
    public Integer getPayNoEnd() {
        return payNoEnd;
    }
    public void setPayNoEnd(Integer payNoEnd) {
        this.payNoEnd = payNoEnd;
    }
    public String getProdJoinDtStr() {
        return prodJoinDtStr;
    }
    public void setProdJoinDtStr(String prodJoinDtStr) {
        this.prodJoinDtStr = prodJoinDtStr;
    }
    public String getProdJoinDtEnd() {
        return prodJoinDtEnd;
    }
    public void setProdJoinDtEnd(String prodJoinDtEnd) {
        this.prodJoinDtEnd = prodJoinDtEnd;
    }
    public String getRmtBasicRegDt() {
        return rmtBasicRegDt;
    }
    public void setRmtBasicRegDt(String rmtBasicRegDt) {
        this.rmtBasicRegDt = rmtBasicRegDt;
    }
    public String getRmtBasicUpdDt() {
        return rmtBasicUpdDt;
    }
    public void setRmtBasicUpdDt(String rmtBasicUpdDt) {
        this.rmtBasicUpdDt = rmtBasicUpdDt;
    }
}
