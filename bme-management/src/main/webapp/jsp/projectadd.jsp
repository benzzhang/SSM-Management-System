<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
                    var option=document.createElement("option");
                    $(".stu_selector").append(('<option value='+data[i].id+'>'+data[i].name+"("+data[i].id+")"+'</option>'));
                }
                $(".stu_selector").append(('<option value="" selected="selected">'+"--请选择--"+'</option>'));
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
                    var option=document.createElement("option");
                    $(".sup_selector").append(('<option value='+data[i].id+'>'+data[i].name+"("+data[i].id+")"+'</option>'));
                }
                $(".sup_selector").append(('<option value="" selected="selected">'+"--请选择--"+'</option>'));
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
        <span>课题管理页面 >> 课题创建页面</span>
    </div>

    <div class="providerAdd">
        <form method="post" action="${pageContext.request.contextPath }/project/add.do">
            <div>
                <label style="color: #FF0000"><u>*红色字段为必填项</u></label>
            </div>
            <div>
                <label style="color: #FF0000">课题编号：</label>
                <input required="required" name="id"/>
                <label style="color: #FF0000">课题负责人：</label>
                <select class="sup_selector" name="directorId"></select>
                <label>实验执行：</label>
                <select class="stu_selector" name="investigationId"></select>
            </div>
            <div>
                <label style="color: #FF0000">课题名称：</label>
                <input required="required" name="name"/>
                <label style="color: #FF0000">课题执行人：</label>
                <select class="stu_selector" name="executorId"></select>
                <label>初稿撰写：</label>
                <select class="stu_selector" name="writingOriginalDraftId"></select>
            </div>
            <div>
                <label>开题时间：</label>
                <input name="proposalTime" placeholder="格式：XXXX-XX-XX"/>
                <label style="color: #FF0000">档案管理员：</label>
                <select class="sup_selector" name="archivistId"></select>
                <label>审阅修改：</label>
                <select class="sup_selector" name="writingReviewEditingId"></select>
            </div>
            <div>
                <label>课题状态：</label>
                <select name="state">
                    <option value="Ended">Ended</option>
                    <option value="Processing">Processing</option>
                    <option value="Suspended">Suspended</option>
                    <option value="NotStarted" selected="selected">NotStarted</option>
                </select>
                <label>概念化：</label>
                <select class="stu_selector" name="conceptualizationId"></select>
                <label>可视化：</label>
                <select class="stu_selector" name="visualizationId"></select>
            </div>
            <div>
                <label>简介：</label>
                <input name="summary"/>
                <label>方法设计：</label>
                <select class="stu_selector" name="methodologyId"></select>
                <label>软件设计：</label>
                <select class="stu_selector" name="softwareId"></select>
            </div>
            <div>
                <label>收录期刊：</label>
                <input name="jid"/>
            </div>
            <%-- 提示信息tips --%>
            <div align="center">
                <label> </label>
                <label id="tips" style="color: green">${tips}</label>
            </div>
            <div class="providerAddBtn" align="center">
                <input type="submit" value="保存">
                <input type="button" onclick="location='${pageContext.request.contextPath}/project/list.do?pn=${pageNow}'" value="返回"/>
            </div>
        </form>
    </div>
</div>
</section>
<%@include file="common/foot.jsp" %>