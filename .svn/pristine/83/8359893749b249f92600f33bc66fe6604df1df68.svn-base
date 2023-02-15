package common.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import common.util.FormatUtil;

public class ByteCalTag extends TagSupport {

    private static final long serialVersionUID = -3094155787894745236L;

    String bytes = "";

    public String getBytes() {
        return bytes;
    }

    public void setBytes(String bytes) {
        this.bytes = bytes;
    }

    public int doEndTag() throws JspException {
        try {
            JspWriter out = pageContext.getOut();
            out.println(FormatUtil.byteCal(bytes));
            return EVAL_PAGE;
        } catch (IOException e) {
            throw new JspException();
        }
    }

}
