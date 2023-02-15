package common.tags;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import common.util.renderer.TreeRenderer;

public class TreeTag extends TagSupport {

    private static final long serialVersionUID = -4261265339968206453L;
    
    private List<Map<String, Object>> list;
    private String colIdx;
    private String colName;
    private String colLevel;
    private String colLeaf;
    
    public List<Map<String, Object>> getList() {
        return list;
    }
    public void setList(List<Map<String, Object>> list) {
        this.list = list;
    }
    public String getColIdx() {
        return colIdx;
    }
    public void setColIdx(String colIdx) {
        this.colIdx = colIdx;
    }
    public String getColName() {
        return colName;
    }
    public void setColName(String colName) {
        this.colName = colName;
    }
    public String getColLevel() {
        return colLevel;
    }
    public void setColLevel(String colLevel) {
        this.colLevel = colLevel;
    }
    public String getColLeaf() {
        return colLeaf;
    }
    public void setColLeaf(String colLeaf) {
        this.colLeaf = colLeaf;
    }
    @Override
    public int doEndTag() throws JspException {
        try {
            JspWriter out = pageContext.getOut();
            out.println(TreeRenderer.renderTree(list, colLevel, colIdx, colName, colLeaf));
            return EVAL_PAGE;
        } catch (IOException e) {
            throw new JspException();
        }
    }
    
}
