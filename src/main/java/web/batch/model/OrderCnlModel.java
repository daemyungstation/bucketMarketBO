package web.batch.model;

import java.math.BigDecimal;

public class OrderCnlModel implements java.io.Serializable {

    private static final long serialVersionUID = 3501256083322507563L;
    
    private String prodCd;
    private Integer no;
    private String appDay;
    private BigDecimal resnAmt = BigDecimal.ZERO;
    private String prdMstRegDt;
    private String prdMstUpdDt;
    
    public String getProdCd() {
        return prodCd;
    }
    public void setProdCd(String prodCd) {
        this.prodCd = prodCd;
    }
    public Integer getNo() {
        return no;
    }
    public void setNo(Integer no) {
        this.no = no;
    }
    public String getAppDay() {
        return appDay;
    }
    public void setAppDay(String appDay) {
        this.appDay = appDay;
    }
    public BigDecimal getResnAmt() {
        return resnAmt;
    }
    public void setResnAmt(BigDecimal resnAmt) {
        this.resnAmt = resnAmt;
    }
    public String getPrdMstRegDt() {
        return prdMstRegDt;
    }
    public void setPrdMstRegDt(String prdMstRegDt) {
        this.prdMstRegDt = prdMstRegDt;
    }
    public String getPrdMstUpdDt() {
        return prdMstUpdDt;
    }
    public void setPrdMstUpdDt(String prdMstUpdDt) {
        this.prdMstUpdDt = prdMstUpdDt;
    }
}
