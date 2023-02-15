package common.viewer;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import common.model.Paging;
import common.viewer.abstractView.JSONView;

public class JSON extends ModelAndView {

    protected HttpServletRequest request;
    @SuppressWarnings("unused")
    private ModelMap model;

    public void setRequest(HttpServletRequest req) {
        this.request = req;
    }

    public JSON() {
        this.model = new ModelMap();
        this.setView(new JSONView());
    }

    public JSON put(String s, List<Map<String, Object>> l) {
        getModelMap().addAttribute(s, l);
        return this;
    }

    public JSON put(String s, ArrayList<String> storageStrArray) {
        getModelMap().addAttribute(s, storageStrArray);
        return this;
    }

    public JSON put(String s, Map<String, Object> o) {
        getModelMap().addAttribute(s, o);
        return this;
    }

    public JSON put(String s, String s1) {
        getModelMap().addAttribute(s, s1);
        return this;
    }

    public JSON put(String s, boolean b) {
        getModelMap().addAttribute(s, b);
        return this;
    }

    public JSON put(String s, String[] arr) {
        getModelMap().addAttribute(s, arr);
        return this;
    }

    public JSON put(String s, Paging p) {
        getModelMap().addAttribute(s, p);
        return this;
    }
}
