<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>管理员账户编辑页面</span>
        </div>
        <div class="providerAdd">
          <s:form id="projectForm" name="projectForm" method="post"
                  action="${pageContext.request.contextPath }/admin/update.do" modelAttribute="admin">
              <div>
                  <label style="color: #FF0000"><u>*红色为不可修改字段</u></label>
              </div>
              <div>
                    <label for="id" style="color:#FF0000">账户：</label>
                    <s:input path="id" readonly="true" cssStyle="color: red"/>
                </div>
                <div>
                    <label>姓名：</label>
                    <s:input path="name"/>
					<font color="red"></font>
                </div>
              <div>
                    <label>权限等级：</label>
                    <s:input path="permissionLevel"/>
                    <font color="red"></font>
              </div>
                <div>
                    <label> </label>
                    <label id="tips" style="color: green">${tips}</label>
                </div>
                <div class="providerAddBtn">
                    <input type="submit" name="save" id="save" value="保存">
                    <input type="button" onclick="location='${pageContext.request.contextPath}/jsp/homepage.jsp'" value="返回"/>
                </div>
            </s:form>
        </div>
    </div>
</section>
<%@include file="common/foot.jsp" %>