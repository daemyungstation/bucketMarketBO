package common.viewer;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import common.viewer.abstractView.EXCELView;

public class EXCEL extends ModelAndView {

    protected HttpServletRequest request;
    protected HttpServletResponse response;
    
    @SuppressWarnings("unused")
    private ModelMap model;

    public void setRequest(HttpServletRequest req) {
        this.request = req;
    }

    public void setResponse(HttpServletResponse response) {
        this.response = response;
    }

    public EXCEL() {
        this.model = new ModelMap();
        this.setView(new EXCELView());
    }

    public EXCEL allPut(Map<String, Object> o) {
        getModelMap().addAllAttributes(o);
        return this;
    }

    public EXCEL put(String s, List<Map<String, Object>> l) {
        getModelMap().addAttribute(s, l);
        return this;
    }

    public EXCEL put(String s, Map<String, Object> o) {
        getModelMap().addAttribute(s, o);
        return this;
    }

    public EXCEL put(String s, String s1) {
        getModelMap().addAttribute(s, s1);
        return this;
    }

    public EXCEL put(String s, String[] arr) {
        getModelMap().addAttribute(s, arr);
        return this;
    }
}
