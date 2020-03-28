<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/3/24
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test</title>
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
        function validateForm(){
            var hhh = $("#studentID").val();
        alert(hhh);
        $.ajax({
            //属性名:属性值
            //请求的路径
            url:'doSelectStudentByID',
            //请求的方式
            type:'POST',
            //是否异步
            async:true,
            //请求超时时间
            timeout:'3000',
            //传递数据的类型
            dataType:'text',
            //传递的数据
            data:{'hhh':hhh},
            success:function(d){
                //解析
                var studentArray = JSON.parse(d);
                for(var i = 0;i < studentArray.length;i++){
                    console.log(studentArray);
                    var $tr = $("<tr >"+
                        "<td>"+studentArray[i].id+"</td>"+
                        "<td>"+studentArray[i].name+"</td>"+
                        "<td>"+studentArray[i].classID+"</td>"+
                        "</tr>");
                    var $table = $("#tableclass");
                    $table.append($tr);
                }
            }
    })
    }
        function addNewclass () {
            var newClass = $("#addClass").val();
            $.ajax({
                url:'doAddNewClass',
                type:'POST',
                async:true,
                timeout:'3000',
                dataType:'text',
                data:{'newClass':newClass},
                success:function(d){
                    var result = JSON.parse(d);
                    if(result==true){
                        alert("添加成功");
                    }else{
                        alert("添加失败");
                    }
                }
            })
        }
</script>
<body>
<div>
    <div>
            <input type="text" name="studentID" placeholder="请输入学号" id="studentID" />
            <input type="submit" value="查询" onclick="validateForm()"/>
    </div>
    <div>
        <input type="text" name="studentID" placeholder="请添加班级 例：17160501" id="addClass" />
        <input type="submit" value="添加" onclick="addNewclass()"/>
    </div>
    <div>
        <table class="table table-hover" >
            <thead align="center">
            <tr>
                <th width="10%">学号</th>
                <th width="20%">姓名</th>
                <th width="10%">班级编号</th>
            </tr>
            </thead>
            <tbody id="tableclass"  align="center">
            </tbody>
        </table>
    </div>

    <div>
        <table class="table table-hover" >
            <thead align="center">
            <tr>
                <th width="10%">学号</th>
                <th width="20%">姓名</th>
                <th width="10%">班级编号</th>
            </tr>
            </thead>
            <tbody id="class"  align="center">
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
