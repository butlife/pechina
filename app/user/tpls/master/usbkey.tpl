<embed id="s_simnew31"  type="application/npsyunew3-plugin" hidden="true"> </embed><!--创建firefox,chrome等插件-->
<script type='text/javascript'>
  $().ready(function(){

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
    
    var usbinterval = setInterval(function(){
        var usbkey = $('#usbkey');
        if (usbkey.data('init') == '1') {
          clearInterval(usbinterval);
          return;
        };
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
            if( s_simnew31.LastError== 0 )
            {
               //获取锁的ID
               var code = toHex(s_simnew31.GetID_1(DevicePath))+toHex(s_simnew31.GetID_2(DevicePath));
               if (code != '40eb50ffffffa3') {
                  //usbkey.data('init', '1');
                  if (!usbkey.val()) {
                    usbkey.val(code);
                  };
               };
            }
          }
         catch(e)  
          {  
                   
          }  
    }, 1000);
  });
</script>
