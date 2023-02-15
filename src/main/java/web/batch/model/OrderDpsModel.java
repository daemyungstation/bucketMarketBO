package web.batch.model;

public class OrderDpsModel implements java.io.Serializable {
    
    /**
     * DLCC DPS Model
     */
    private static final long serialVersionUID = -8790593304728926158L;
    
    private String ordMstIdx;
    private Integer payNo;
    private String accntNo;
    private String payDay;
    private String payMthd;
    private Integer payAmt;
    private Integer relAmt;
    private Integer addAmt;
    private String payInDay;
    
    public String getOrdMstIdx() {
        return ordMstIdx;
    }
    public void setOrdMstIdx(String ordMstIdx) {
        this.ordMstIdx = ordMstIdx;
    }
    public Integer getPayNo() {
        return payNo;
    }
    public void setPayNo(Integer payNo) {
        this.payNo = payNo;
    }
    public String getAccntNo() {
        return accntNo;
    }
    public void setAccntNo(String accntNo) {
        this.accntNo = accntNo;
    }
    public String getPayDay() {
        return payDay;
    }
    public void setPayDay(String payDay) {
        this.payDay = payDay;
    }
    public String getPayMthd() {
        return payMthd;
    }
    public void setPayMthd(String payMthd) {
        this.payMthd = payMthd;
    }
    public Integer getPayAmt() {
        return payAmt;
    }
    public void setPayAmt(Integer payAmt) {
        this.payAmt = payAmt;
    }
    public Integer getRelAmt() {
        return relAmt;
    }
    public void setRelAmt(Integer relAmt) {
        this.relAmt = relAmt;
    }
    public Integer getAddAmt() {
        return addAmt;
    }
    public void setAddAmt(Integer addAmt) {
        this.addAmt = addAmt;
    }
    public String getPayInDay() {
        return payInDay;
    }
    public void setPayInDay(String payInDay) {
        this.payInDay = payInDay;
    }
}
