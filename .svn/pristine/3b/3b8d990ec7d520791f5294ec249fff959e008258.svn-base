package common.viewer.abstractView;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import common.util.StringUtil;
import net.sf.json.JSONObject;

public class JSONPView extends AbstractView {
    public JSONPView() {
        setContentType("text/json; charset=utf-8");
    }

    @Override
    protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {

        JSONObject jsonObject = JSONObject.fromObject(map);

        response.setContentType("text/json; charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();

        String callback = StringUtil.getString(request.getParameter("request"), "");
        if ("".equals(callback)) {
            out.write(callback + "(" + jsonObject.toString() + ")");
        } else {
            out.write(jsonObject.toString());
        }
        out.flush();

    }
}
