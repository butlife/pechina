<?php
if (!empty($_POST['UserName']) )
{

	echo "用户名是：";
	echo $_POST['UserName'] . "<BR>";
	echo "密码是：";
	echo $_POST['Password'];
}
else
{
?>
<html>
<head>
<title>会员登陆</title>
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<embed id="s_simnew31"  type="application/npsyunew3-plugin" hidden="true"> </embed><!--创建firefox,chrome等插件-->


<script language="javascript" type="text/javascript">
<!--
 var digitArray = new Array('0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f');

function toHex( n ) {

        var result = ''
        var start = true;

        for ( var i=32; i>0; ) {
                i -= 4;
                var digit = ( n >> i ) & 0xf;

                if (!start || digit != 0) {
                        start = false;
                        result += digitArray[digit];
                }
        }

        return ( result == '' ? '0' : result );
}

function login_onclick() 
{
	 try
	 {
		var DevicePath,mylen,ret;
		var s_simnew31;
		//创建插件或控件
		if(navigator.userAgent.indexOf("MSIE")>0 && !navigator.userAgent.indexOf("opera") > -1)
		{
			s_simnew31=new ActiveXObject("Syunew3A.s_simnew3");
		}
		else
		{
				s_simnew31= document.getElementById('s_simnew31');
		}
		DevicePath = s_simnew31.FindPort(0);//'来查找加密锁，0是指查找默认端口的锁
		if( s_simnew31.LastError!= 0 )
		{
			window.alert ( "未发现加密锁，请插入加密锁");
		}
		else
		{
			
			 //'读取锁的ID
            //frmlogin.KeyID.value=toHex(s_simnew31.GetID_1(DevicePath))+toHex(s_simnew31.GetID_2(DevicePath));
            //if( s_simnew31.LastError!= 0 )
			//{
	        //    window.alert( "获取用户名错误,错误码是"+s_simnew31.LastError.toString());
		    //    return ;
			//}
			
			//获取设置在锁中的用户名
			//先从地址0读取字符串的长度,使用默认的读密码"FFFFFFFF","FFFFFFFF"
			ret=s_simnew31.YReadEx(0,1,"ffffffff","ffffffff",DevicePath);
			mylen =s_simnew31.GetBuf(0);
			//再从地址1读取相应的长度的字符串，,使用默认的读密码"FFFFFFFF","FFFFFFFF"
			frmlogin.UserName.value=s_simnew31.YReadString(1,mylen, "ffffffff", "ffffffff", DevicePath);
			if( s_simnew31.LastError!= 0 )
			{
				window.alert(  "Err to GetUserName,ErrCode is:"+s_simnew31.LastError.toString());
				return ;
			}

			//获到设置在锁中的用户密码,
			//先从地址20读取字符串的长度,使用默认的读密码"FFFFFFFF","FFFFFFFF"
			ret=s_simnew31.YReadEx(20,1,"ffffffff","ffffffff",DevicePath);
			mylen =s_simnew31.GetBuf(0);
			//再从地址21读取相应的长度的字符串，,使用默认的读密码"FFFFFFFF","FFFFFFFF"
			frmlogin.Password.value=s_simnew31.YReadString(21,mylen,"ffffffff", "ffffffff", DevicePath);
			if( s_simnew31.LastError!= 0 )
			{
				window.alert( "获取用户密码错误,错误码是:"+s_simnew31.LastError.toString());
				return ;
			}
			
			frmlogin.submit ();
		}
	  }

	 catch(e)  
	  {  
				alert(e.name + ": " + e.message+"。可能是没有安装相应的控件或插件");
				return false;
	  }  

}
</SCRIPT>

<h1 align="center">　</h1>
<h1 align="center"><font color="#FF0000">会员登录<br>
  </font></h1>
<hr align="center">
<div align="center"><br>
  请在下表中输入您的会员编号及对应的登录密码 </div>
<form action=login.php id=frmlogin method=post name="frmlogin" >
  <div align="center">
    <table width="20" border="0" cellspacing="0" cellpadding="0" bordercolorlight="#000000" bordercolordark="#FFFFFF">
      <tr>
        <td>
          <table border=1 width="260">
            <tbody> 
            <tr> 
              <td height="30">用户名称</td>
              <td height="30"> 
                <input id=UserName name=UserName size="20" maxlength="20" >
              </td>
            </tr>
            <tr> 
              <td>登录密码</td>
              <td> 
                <input id=Password name=Password type=password size="20" maxlength="20" >
              </td>
            </tr>
            </tbody> 
          </table>
        </td>
      </tr>
    </table>
    <P>
      <input type="submit" name="Submit" value="开始登录" onclick="login_onclick()">
  </div>
</form>
<hr>
<h2 align=center>　</h2>
<h2 align=center>　</h2>
<h2 align=center>　</h2>
</body>
</html>
<?php
}
?>