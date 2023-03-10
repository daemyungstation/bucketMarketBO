package common.viewer;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import common.viewer.abstractView.PDFView;

public class PDF extends ModelAndView {

    protected HttpServletRequest request;
    @SuppressWarnings("unused")
    private ModelMap model;

    public void setRequest(HttpServletRequest req) {
        this.request = req;
    }

    public PDF() {
        this.model = new ModelMap();
        this.setView(new PDFView());
    }

    public PDF allPut(Map<String, Object> o) {
        getModelMap().addAllAttributes(o);
        return this;
    }

    public PDF put(String s, List<Map<String, Object>> l) {
        getModelMap().addAttribute(s, l);
        return this;
    }

    public PDF put(String s, Map<String, Object> o) {
        getModelMap().addAttribute(s, o);
        return this;
    }

    public PDF put(String s, String s1) {
        getModelMap().addAttribute(s, s1);
        return this;
    }

    public PDF put(String s, String[] arr) {
        getModelMap().addAttribute(s, arr);
        return this;
    }
}
