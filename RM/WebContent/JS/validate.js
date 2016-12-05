function userCheck(){   //用户登录验证
if(document.form1.account.value==""){
window.alert("请输入用户名称");
return false;
}
if(document.form1.password.value==""){
window.alert("请输入用户密码");
return false;
}
return true;
}



function accountADD(){   //用户注册验证
if(document.form.account.value==""){
window.alert("请输入用户名！");
return false;
}
if(document.form.password.value==""){
window.alert("请输入用户登录密码！");
return false;
}
if(document.form.repeatPassword.value==""){
window.alert("请输入重复登录密码！");
return false;
}
if (form.password.value!=form.repeatPassword.value){
alert("您两次输入的密码不一致，请重新输入！");
return false;
}
if(document.form.name.value==""){
window.alert("请输入用户姓名！");
return false;
}
if(document.form.QQnumber.value==""){
window.alert("请输入QQ号码！");
return false;
}
if(isNaN(document.form.QQnumber.value)){
window.alert("QQ号码必须为数字！");
return false;
}
if(document.form.mainPage.value==""){
window.alert("请输入主页地址！");
return false;
}
if(document.form.interest.value==""){
window.alert("请输入兴趣内容！");
return false;
}
if(document.form.eMail.value==""){
window.alert("请输入eMail地址内容！");
return false;
}
var i=form.eMail.value.indexOf("@");
var j=form.eMail.value.indexOf(".");
if((i<0)||(i-j>0)||(j<0)){
alert("您输入的Email地址不正确，请重新输入！");return false;
}
return true;
}





function hostUpdate(){   //用户注册验证
if(document.form.account.value==""){
window.alert("请输入用户名！");
return false;
}
if(document.form.password.value==""){
window.alert("请输入用户登录密码！");
return false;
}
if(document.form.repeatPassword.value==""){
window.alert("请输入用户重复密码！");
return false;
}
if (form.password.value!=form.repeatPassword.value){
alert("您两次输入的密码不一致，请重新输入！");
return false;
}
if (form.password.value==""||form.repeatPassword.value==""){
	alert("请输入密码");
	return false;
	}

if(document.form.eMail.value==""){
window.alert("请输入eMail地址内容！");
return false;
}
var i=form.eMail.value.indexOf("@");
var j=form.eMail.value.indexOf(".");
if((i<0)||(i-j>0)||(j<0)){
alert("您输入的Email地址不正确，请重新输入！");return false;
}
return true;
}







function friendAdd(){   //朋友添加
if(document.form.name.value==""){
window.alert("请输入朋友昵称！");
return false;
}
if(document.form.QQNumber.value==""){
window.alert("请输入QQ号码！");
return false;
}
if(isNaN(document.form.QQNumber.value)){
window.alert("QQ号码必须为数字！");
return false;
}
if(document.form.description.value==""){
window.alert("请输入朋友描述信息！");
return false;
}
if (document.form.description.value.length>200){
	alert("内容至多为200位，请重新输入！");
	return false;
}
return true;
}


function voteAdd(){   //留言添加
//if(document.form.voteContent.value==""){
//window.alert("请输入留言内容！");
//return false;
//}
//if (document.form.voteContent.value.length>200){
//	alert("内容至多为400位，请重新输入！");
//	return false;
//}
return true;
}

function linkAdd(){   //友情链接添加
	if(document.form.name.value==""){
	window.alert("请输入名称！");
	return false;
	}
	if(document.form.url.value==""){
		window.alert("请输入链接内容！");
		return false;
		}
	return true;
	}




function addArticleType(){   //文章类型添加
if(document.form.typeName.value==""){
window.alert("请输入文章类型名称！");
return false;
}
if(document.form.description.value==""){
window.alert("请输入文章类型描述！");
return false;
}
return true;
}


function addArticle(){   //文章添加
if(document.form.title.value==""){
window.alert("请输入文章题目！");
return false;
}
if(document.form.content.value==""){
window.alert("请输入文章内容！");
return false;
}
return true;
}



function addRestore(){   //回复添加
if(document.form.reTitle.value==""){
window.alert("请输入回复题目！");
return false;
}
if(document.form.reContent.value==""){
window.alert("请输入回复内容！");
return false;
}
return true;
}



function quit(){
if(confirm("您真的要退出吗？")){
window.location.href="leave.jsp";
}
}


function sendInformation(){   //主题发布
if(document.form.title.value==""){
window.alert("请输入主题名称");
return false;
}
if(document.form.content.value==""){
window.alert("请输入主题内容");
return false;
}
if (form.content.value.length>1600){
alert("内容至多为1600位，请重新输入！");
return false;
}
return true;
}

function backInformation(){   //主题回复
if(document.form.title.value==""){
window.alert("请输入回复主题名称");
return false;
}
if(document.form.content.value==""){
window.alert("请输入回复主题内容");
return false;
}
if (form.content.value.length>1600){
alert("内容至多为1600位，请重新输入！");
return false;
}
return true;
}


function registerCheck(){      //新用户注册验证
if (form.account.value==""){
alert("请输入用户名！");return false;
}

if (form.password1.value==""){
alert("请输入密码！");return false;
}
if (form.password1.value.length<6){
alert("密码至少为6位，请重新输入！");return false;
}		
if (form.password2.value==""){
alert("请输入确认密码！");return false;
}
if (form.password1.value!=form.password2.value){
alert("您两次输入的密码不一致，请重新输入！");return false;
}
		

if (form.email.value==""){
alert("请输入Email地址！");return false;
}
var i=form.email.value.indexOf("@");
var j=form.email.value.indexOf(".");
if((i<0)||(i-j>0)||(j<0)){
alert("您输入的Email地址不正确，请重新输入！");return false;
}
return true;
}





function CheckDate(INDate)
{ if (INDate=="")
    {return true;}
	subYY=INDate.substr(0,4)
	if(isNaN(subYY) || subYY<=0){
		return true;
	}
	//转换月份
	if(INDate.indexOf('-',0)!=-1){	separate="-"}
	else{
		if(INDate.indexOf('/',0)!=-1){separate="/"}
		else {return true;}
		}
		area=INDate.indexOf(separate,0)
		subMM=INDate.substr(area+1,INDate.indexOf(separate,area+1)-(area+1))
		if(isNaN(subMM) || subMM<=0){
		return true;
	}
		if(subMM.length<2){subMM="0"+subMM}
	//转换日
	area=INDate.lastIndexOf(separate)
	subDD=INDate.substr(area+1,INDate.length-area-1)
	if(isNaN(subDD) || subDD<=0){
		return true;
	}
	if(eval(subDD)<10){subDD="0"+eval(subDD)}
	NewDate=subYY+"-"+subMM+"-"+subDD
	if(NewDate.length!=10){return true;}
    if(NewDate.substr(4,1)!="-"){return true;}
    if(NewDate.substr(7,1)!="-"){return true;}
	var MM=NewDate.substr(5,2);
	var DD=NewDate.substr(8,2);
	if((subYY%4==0 && subYY%100!=0)||subYY%400==0){ //判断是否为闰年
		if(parseInt(MM)==2){
			if(DD>29){return true;}
		}
	}else{
		if(parseInt(MM)==2){
			if(DD>28){return true;}
		}	
	}
	var mm=new Array(1,3,5,7,8,10,12); //判断每月中的最大天数
	for(i=0;i< mm.length;i++){
		if (parseInt(MM) == mm[i]){
			if(parseInt(DD)>31){
				return true;
			}else{
				return false;
			}
		}
	}
   if(parseInt(DD)>30){return true;}
   if(parseInt(MM)>12){return true;}
   return false;
   }



function Myopen(divID,myform){ //根据传递的参数确定显示的层
	divID.style.display='';
	divID.style.left=(screen.width-240)/2;
	divID.style.top=(screen.height-277)/2;
	myform.UID.focus();
}

function clockon(bgclock){
	var now=new Date();
	var year=now.getYear();
	var month=now.getMonth();
	var date=now.getDate();
	var day=now.getDay();
	var hour=now.getHours();
	var minu=now.getMinutes();
	var sec=now.getSeconds();
	var week;
	month=month+1;
	if(month<10) month="0"+month;
	if(date<10) date="0"+date;
	if(hour<10) hour="0"+hour;
	if(minu<10) minu="0"+minu;
	if(sec<10) sec="0"+sec;
	var arr_week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
	week=arr_week[day];
	var time="";
	time=year+"年"+month+"月"+date+"日 "+week+" "+hour+":"+minu+":"+sec;
	if(document.all){
		bgclock.innerHTML=""+time+""
	}
	var timer=setTimeout("clockon(bgclock)",200);
} 




