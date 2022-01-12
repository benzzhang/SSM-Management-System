<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="common/head.jsp"%>

<div class="right">
       <div class="location">
           <strong>你现在所在的位置是:</strong>
           <span>课题管理页面</span>
       </div>
       <div class="search">
       <form action="${pageContext.request.contextPath }/project/listByCondition.do" method="get">
		   <span>课题编号：</span>
		   <input width="200px" name="id" type="text" value="${id}">
		   <span>课题名称：</span>
		   <input name="name" type="text" value="${name}">
		   <span>课题状态：</span>
		   <select name="state">
			   <option value="" selected="selected">--请选择--</option>
			   <option value="Ended">Ended</option>
			   <option value="Processing">Processing</option>
			   <option value="Suspended">Suspended</option>
			   <option value="NotStarted">NotStarted</option>
		   </select>

		   <input value="查 询" type="submit" id="searchbutton">
			 <a href="${pageContext.request.contextPath }/jsp/projectadd.jsp">新建课题</a>
		</form>
		
       </div>
       <!-- 课题列表-表格 -->
      <table class="providerTable" cellpadding="0" cellspacing="0">
          <tr class="firstTr">
              <th width="10%">课题编号</th>
              <th width="20%">课题名称</th>
              <th width="10%">开题时间</th>
              <th width="10%">课题状态</th>
			  <th width="30%">课题简介</th>
			  <th width="10%">收录期刊</th>
              <th width="15%">操作</th>
          </tr>
          <c:forEach items="${pageInfo.list}" var="project">
				<tr>
					<td>
					<span>${project.id} </span>
					</td>
					
					<td>
					<span>${project.name}</span>
					</td>

					<td>
					<span><f:formatDate type="date" value="${project.proposalTime}"/></span>
					</td>
					
					<td>
					<span>${project.state}</span>
					</td>
										
					<td>
					<span>${project.summary}</span>
					</td>
					
					<td>
					<span>${project.jid}</span>
					</td>

					<td>
					<span><a class="viewBill" href="${pageContext.request.contextPath }/project/view.do?id=${project.id}&flag=update"><img src="${pageContext.request.contextPath }/images/read.png" alt="查看" title="查看"/></a></span>
					<span><a class="modifyBill" href="${pageContext.request.contextPath }/project/modify.do?id=${project.id}&flag=update"><img src="${pageContext.request.contextPath }/images/xiugai.png" alt="修改" title="修改"/></a></span>
					<span><a class="deleteBill" href="javascript:if(confirm('确认删除课题 ？')){location.href='${pageContext.request.contextPath }/project/del.do?id=${project.id}'}"><img src="${pageContext.request.contextPath }/images/schu.png" alt="删除" title="删除"/></a></span>
					</td>
				</tr>
				</c:forEach>
      </table>
      <div class="page-bar">
		<ul class="page-num-ul clearfix">
			<li>共${pageInfo.total}条记录&nbsp;&nbsp; ${pageInfo.pageNum}/${pageInfo.pages}页</li>
				<a href="${pageContext.request.contextPath }/project/list.do?pn=${1}">首页</a>
				<a href="${pageContext.request.contextPath }/project/list.do?pn=${pageInfo.prePage}">上一页</a>
				<c:forEach items="${pageInfo.navigatepageNums}" var="num">
					<a href="${pageContext.request.contextPath }/project/list.do?pn=${num}">${num}</a>
				</c:forEach>
				<a href="${pageContext.request.contextPath }/project/list.do?pn=${pageInfo.nextPage}">下一页</a>
				<a href="${pageContext.request.contextPath }/project/list.do?pn=${pageInfo.pages}">尾页</a>
		</ul>
  </div>
</section>

<%@include file="common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billlist.js"></script>