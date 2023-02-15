<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span><c:out value="${TITLE }"/> 이미지 미리보기</span>
                    </h2>
                </div>
                <table cellspacing="0" class="table-row table-a">
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>
                                <label class="label">
                                    <span>이미지</span>
                                </label>
                            </th>
                            <td>
                                <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${info.CMM_FLE_ATT_PATH }"/><c:out value="${info.CMM_FLE_SYS_NM }"/>">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="grid section-button-search">
                    <a href="javascript:self.close();" class="button small">
                        <span>닫기</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
</body>
</html>
