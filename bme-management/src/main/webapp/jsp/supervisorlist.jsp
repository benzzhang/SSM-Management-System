<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="common/head.jsp"%>

<div class="right">
       <div class="location">
           <strong>你现在所在的位置是:</strong>
           <span>导师管理页面</span>
       </div>
       <div class="search">
       <form action="${pageContext.request.contextPath }/supervisor/listByCondition.do" method="get">
		   <span>工号：</span>
		   <input name="id" type="text" value="${id}">
		   <span>姓名：</span>
		   <input name="name" type="text" value="${name}">
		   <span>院系：</span>
		   <input name="college" type="text" value="${college}">
		   <span>性别：</span>
		   <select name="sex">
			   <option value="" selected="selected">--请选择--</option>
<%--			   <option value="0">未知</option>--%>
			   <option value="1">男</option>
			   <option value="2">女</option>
		   </select>

		   <input value="查 询" type="submit" id="searchbutton">

		   <a href="${pageContext.request.contextPath }/jsp/supervisoradd.jsp">添加导师</a>
		</form>
		
       </div>
       <!-- 课题列表-表格 -->
      <table class="providerTable" cellpadding="0" cellspacing="0">
          <tr class="firstTr">
              <th width="15%">工号</th>
			  <th width="15%">姓名</th>
<%--              <th width="10%">学生性别</th>--%>
              <th width="20%">身份证号</th>
              <th width="15%">院系</th>
			  <th width="15%">操作</th>
		  </tr>
          <c:forEach items="${pageInfo.list}" var="supervisor">
				<tr>
					<td>
						<span>${supervisor.id} </span>
					</td>
					
					<td>
						<span>${supervisor.name}</span>
					</td>

<%--					<td>
						<span>${supervisor.sex}</span>
					</td>--%>
					
					<td>
						<span>${supervisor.idNumber}</span>
					</td>
										
					<td>
						<span>${supervisor.college}</span>
					</td>

					<td>
					<span><a class="modifyBill" href="${pageContext.request.contextPath }/supervisor/modify.do?id=${supervisor.id}&flag=update"><img src="${pageContext.request.contextPath }/images/xiugai.png" alt="修改" title="修改"/></a></span>
					<span><a class="deleteBill" href="javascript:if(confirm('确认删除该导师 ？')){location.href='${pageContext.request.contextPath }/supervisor/del.do?id=${supervisor.id}'}"><img src="${pageContext.request.contextPath }/images/schu.png" alt="删除" title="删除"/></a></span>
					</td>
				</tr>
				</c:forEach>
      </table>
      <div class="page-bar">
		<ul class="page-num-ul clearfix">
			<li>共${pageInfo.total}条记录&nbsp;&nbsp; ${pageInfo.pageNum}/${pageInfo.pages}页</li>
				<a href="${pageContext.request.contextPath }/supervisor/list.do?pn=${1}">首页</a>
				<a href="${pageContext.request.contextPath }/supervisor/list.do?pn=${pageInfo.prePage}">上一页</a>
				<c:forEach items="${pageInfo.navigatepageNums}" var="num">
					<a href="${pageContext.request.contextPath }/supervisor/list.do?pn=${num}">${num}</a>
				</c:forEach>
				<a href="${pageContext.request.contextPath }/supervisor/list.do?pn=${pageInfo.nextPage}">下一页</a>
				<a href="${pageContext.request.contextPath }/supervisor/list.do?pn=${pageInfo.pages}">尾页</a>
		</ul>
  </div>
</section>

<%@include file="common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billlist.js"></script>