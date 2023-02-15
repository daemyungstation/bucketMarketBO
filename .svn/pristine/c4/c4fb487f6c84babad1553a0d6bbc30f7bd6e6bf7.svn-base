package common.viewer.abstractView;

import java.io.OutputStream;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import common.util.DateUtil;
import common.util.ExcelUtil;
import common.util.StringUtil;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class EXCELView extends AbstractExcelView  {

    @Override
    @SuppressWarnings("unchecked")
    protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        String fileName = StringUtil.getString(model, "fileName", "daemyung_faq_" + DateUtil.getCurrentDateTime());
        String[] headerTitle = StringUtil.getArray(model, "headerTitle");
        String[] cellField = StringUtil.getArray(model, "cellField");
        String[] cellType = StringUtil.getArray(model, "cellType");
        String[] colSize = StringUtil.getArray(model, "colSize");
        List<Map<String, Object>> list = (List<Map<String, Object>>) model.get("list");
        try {
            ExcelUtil.setWorkbook(workbook, headerTitle, cellField, cellType, colSize, list);
            // ContetnType, Header 정보 설정
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "attachment; filename=" + fileName + ".xls");
            OutputStream os = response.getOutputStream();

            // Excel File 다운로드
            workbook.write(os);
            os.close();
        } catch (Exception e) {
            log.error(Arrays.toString(e.getStackTrace()));
            if (log.isDebugEnabled()) {
                e.printStackTrace();
            }
        }
    }

}
