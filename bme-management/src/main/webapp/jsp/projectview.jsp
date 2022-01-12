<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
    // 从ID获取姓名-导师
    function getSupName(ID,DOMid){
        $.ajax({
            type:"post",
            dataType:"json",
            url:"${pageContext.request.contextPath }/supervisor/supselect.do",
            success:function(data){
                var len=data.length;
                for(var i=0;i<len;i++){
                    // console.log(data[i].id)
                    // console.log("ID"+ID)
                    if (ID == data[i].id){
                        document.getElementById(DOMid).value=data[i].name
                    }
                }
            },
            error:function(data){
                console.log(data);
            }
        });
    }
    // 从ID获取姓名-学生
    function getStuName(ID,DOMid){
        $.ajax({
            type:"post",
            dataType:"json",
            url:"${pageContext.request.contextPath }/student/stuselect.do",
            success:function(data){
                var len=data.length;
                for(var i=0;i<len;i++){
                    // console.log(data[i].id)
                    // console.log("ID"+ID)
                    if (ID == data[i].id){
                        document.getElementById(DOMid).value=data[i].name
                    }
                }
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
        <span>课题管理页面 >> 课题信息查看</span>
    </div>
    <div class="providerAdd">
        <%-- 两个对象的使用； modelAttribute 只能用一个:用了需要使用selected的project
                                                    members对象用的EL表达式 --%>
        <s:form  modelAttribute="project">
            <div>
                <label for="id" >课题编号：</label>
                <s:input path="id" readonly="true"/>

                <label>课题负责人：</label>
                <input id="directorId" readonly="true"/>
                <script type="text/javascript">
                    getSupName("${members.directorId}","directorId");
                </script>

                <label>实验执行：</label>
                <input id="investigationId" readonly="true"/>
                <script type="text/javascript">
                    getStuName("${members.investigationId}","investigationId");
                </script>
            </div>
            <div>
                <label>课题名称：</label>
                <s:input path="name" readonly="true"/>

                <label>课题执行人：</label>
                <input id="executorId" readonly="true"/>
                <script type="text/javascript">
                    getStuName("${members.executorId}","executorId");
                </script>

                <label>初稿撰写：</label>
                <input id="writingOriginalDraftId" readonly="true"/>
                <script type="text/javascript">
                    getStuName("${members.writingOriginalDraftId}","writingOriginalDraftId");
                </script>

            </div>
            <div>
                <label>开题时间：</label>
                <s:input path="proposalTime" readonly="true"/>

                <label>档案管理员：</label>
                <input id="archivistId" readonly="true"/>
                <script type="text/javascript">
                    getSupName("${members.archivistId}","archivistId");
                </script>

                <label>审阅修改：</label>
                <input id="writingReviewEditingId" readonly="true"/>
                <script type="text/javascript">
                    getSupName("${members.writingReviewEditingId}","writingReviewEditingId");
                </script>

            </div>
            <div>
                <label>课题状态：</label>
                <s:select path="state" disabled="true">
                    <s:option value="Ended">Ended</s:option>
                    <s:option value="Processing">Processing</s:option>
                    <s:option value="Suspended">Suspended</s:option>
                    <s:option value="NotStarted">NotStarted</s:option>
                </s:select>

                <label>概念化：</label>
                <input id="conceptualizationId" readonly="true"/>
                <script type="text/javascript">
                    getStuName("${members.conceptualizationId}","conceptualizationId");
                </script>

                <label>可视化：</label>
                <input id="visualizationId" readonly="true"/>
                <script type="text/javascript">
                    getStuName("${members.visualizationId}","visualizationId");
                </script>

            </div>
            <div>
                <label>简介：</label>
                <s:input path="summary" readonly="true"/>

                <label>方法设计：</label>
                <input id="methodologyId" readonly="true"/>
                <script type="text/javascript">
                    getStuName("${members.methodologyId}","methodologyId");
                </script>

                <label>软件设计：</label>
                <input id="softwareId" readonly="true"/>
                <script type="text/javascript">
                    getStuName("${members.softwareId}","softwareId");
                </script>

            </div>
            <div>
                <label>收录期刊：</label>
                <s:input path="jid" readonly="true"/>
            </div>
            <div align="center">
                <label> </label>
                <label id="tips" style="color: green">${tips}</label>
            </div>
            <div class="providerAddBtn" align="center">
                <input type="button" onclick="location='${pageContext.request.contextPath}/project/list.do?pn=${pageNow}'" value="返回"/>
            </div>
        </s:form>
    </div>
</div>
</section>
<%@include file="common/foot.jsp" %>