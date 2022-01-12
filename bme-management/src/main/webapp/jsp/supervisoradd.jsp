<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>

<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>导师管理页面 >> 导师添加页面</span>
    </div>
    <div class="providerAdd">
        <form method="post" action="${pageContext.request.contextPath }/supervisor/add.do">
            <div>
                <label style="color: #FF0000"><u>*红色字段为必填项</u></label>
            </div>
            <div>
                <label style="color:#FF0000">工号：</label>
                <input name="id" required="required" cssStyle="color: red"/>
            </div>
            <div>
                <label style="color: #FF0000">姓名：</label>
                <input required="required" name="name"/>
            </div>
            <div>
                <label style="color: #FF0000">性别：</label>
                <select name="sex">
                    <option value="0" selected="selected">未知</option>
                    <option value="1">男</option>
                    <option value="2">女</option>
                </select>
            </div>
            <div>
                <label>身份证号：</label>
                <input name="idNumber"/>
            </div>
            <div>
                <label>院系：</label>
                <input name="college"/>
            </div>
            <div>
                <label> </label>
                <label id="tips" style="color: green">${tips}</label>
            </div>
            <div class="providerAddBtn">
                <input type="submit" value="保存">
                <input type="button" onclick="location='${pageContext.request.contextPath}/supervisor/list.do?pn=${pageNow}'" value="返回"/>
            </div>
        </form>
    </div>
</div>
</section>
<%@include file="common/foot.jsp" %>