<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
    // 获取学生ID及姓名，放入select中
    $(document).ready(function () {
        getStu();
        getSup();
    });
    function getStu(){
        $.ajax({
            type:"post",
            dataType:"json",
            url:"${pageContext.request.contextPath }/student/stuselect.do",
            success:function(data){
                var len=data.length;
                for(var i=0;i<len;i++){
                    $(".stu_selector").append(('<option value='+data[i].id+'>'+data[i].name+"("+data[i].id+")"+'</option>'));
                }
                // $(".stu_selector").append(('<option value="" selected="selected">'+"--请选择--"+'</option>'));
            },
            error:function(data){
                console.log(data);
            }
        });
    }
    // 获取导师ID及姓名，放入select
    function getSup(){
        $.ajax({
            type:"post",
            dataType:"json",
            url:"${pageContext.request.contextPath }/supervisor/supselect.do",
            success:function(data){
                var len=data.length;
                for(var i=0;i<len;i++){
                    $(".sup_selector").append(('<option value='+data[i].id+'>'+data[i].name+"("+data[i].id+")"+'</option>'));
                }
                // $(".sup_selector").append(('<option value="" selected="selected">'+"--请选择--"+'</option>'));

            },
            error:function(data){
                console.log(data);
            }
        });
    }
</script>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>课题管理页面 >> 课题修改页面</span>
        </div>
        <div class="providerAdd">
            <%-- 两个对象的使用； modelAttribute 只能用一个:用了需要使用selected的project
                                                        members对象用的EL表达式 --%>
          <s:form id="projectForm" name="projectForm" method="post"
                  action="${pageContext.request.contextPath }/project/update.do" modelAttribute="project">
                <div>
                    <label style="color: #ff0000"><u>*红色为不可修改字段</u></label>
                </div>
                <div>
                    <label for="id" style="color:#FF0000">课题编号：</label>
                    <s:input path="id" readonly="true"/>
                    <label style="color: #FF0000">课题负责人：</label>
                    <input name="directorId" value="${members.directorId}" readonly="true"/>
                    <label>实验执行：</label>
                    <select class="stu_selector" name="investigationId">
                        <option value="${members.investigationId}" selected="selected">${members.investigationId}</option>
                    </select>
                </div>
                <div>
                    <label>课题名称：</label>
                    <s:input path="name"/>
                    <label>课题执行人：</label>
                    <select class="stu_selector" name="executorId">
                        <option value="${members.executorId}" selected="selected">${members.executorId}</option>
                    </select>
                    <label>初稿撰写：</label>
                    <select class="stu_selector" name="writingOriginalDraftId">
                        <option value="${members.writingOriginalDraftId}" selected="selected">${members.writingOriginalDraftId}</option>
                    </select>
                </div>
                <div>
                    <label>开题时间：</label>
                    <s:input path="proposalTime" placeholder="格式：XXXX-XX-XX"/>
                    <label style="color: #FF0000">档案管理员：</label>
                    <input name="archivistId" value="${members.archivistId}" readonly="true"/>
                    <label>审阅修改：</label>
                    <select class="sup_selector" name="writingReviewEditingId">
                        <option value="${members.writingReviewEditingId}" selected="selected">${members.writingReviewEditingId}</option>
                    </select>
                </div>
                <div>
                    <label>课题状态：</label>
                    <s:select path="state">
                        <s:option value="Ended">Ended</s:option>
                        <s:option value="Processing">Processing</s:option>
                        <s:option value="Suspended">Suspended</s:option>
                        <s:option value="NotStarted">NotStarted</s:option>
                    </s:select>
                    <label>概念化：</label>
                    <select class="stu_selector" name="conceptualizationId">
                        <option value="${members.conceptualizationId}" selected="selected">${members.conceptualizationId}</option>
                    </select>
                    <label>可视化：</label>
                    <select class="stu_selector" name="visualizationId">
                        <option value="${members.visualizationId}" selected="selected">${members.visualizationId}</option>
                    </select>
                </div>
                <div>
                    <label>简介：</label>
                    <s:input path="summary"/>
                    <label>方法设计：</label>
                    <select class="stu_selector" name="methodologyId">
                        <option value="${members.methodologyId}" selected="selected">${members.methodologyId}</option>
                    </select>
                    <label>软件设计：</label>
                    <select class="stu_selector" name="softwareId">
                        <option value="${members.softwareId}" selected="selected">${members.softwareId}</option>
                    </select>
                </div>
                <div>
                    <label>收录期刊：</label>
                    <s:input path="jid"/>
                </div>
                <div align="center">
                    <label> </label>
                    <label id="tips" style="color: green">${tips}</label>
                </div>
                <div class="providerAddBtn" align="center">
                    <input type="submit" name="save" id="save" value="保存">
                    <input type="button" onclick="location='${pageContext.request.contextPath}/project/list.do?pn=${pageNow}'" value="返回"/>
                </div>
            </s:form>
        </div>
    </div>
</section>
<%@include file="common/foot.jsp" %>