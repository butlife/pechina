<div class='modal fade' id='usbkey-check' aria-hidden="true" role='dialog' data-keyboard='false' data-show='false' tabindex="-1">
    <div class='modal-header'>
        <h3>正在检查加密狗</h3>
    </div>
    <div class="modal-body">
        <p class='msg'>正在查找设备...</p>
    </div>
    <div class="modal-footer"></div>
</div>
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
    var incheck = false;
    setInterval(function(){
        if (incheck) {return;};
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
        var code = '';
        if( s_simnew31.LastError!= 0 )
        {
            incheck = true;
            $('#usbkey-check').modal('show');
        }else{
            incheck = true;
            code = toHex(s_simnew31.GetID_1(DevicePath))+toHex(s_simnew31.GetID_2(DevicePath));
            $.ajax({
                type:'post',
                url:'index.php?exam-app-index-checkusbkey&code=' + code,
                success:function(html){
                    if (html != '0') {
                        $('#usbkey-check').modal('show');
                    }
                },
                error:function(){
                    incheck = false;
                }
            });
        }
    }, 1000 * 5);

$('#usbkey-check')
.modal({keyboard:false})
.on('shown', function(){
    var doing = false;
    setInterval(function(){
        var usb = $('#usbkey-check');
        if (usb.data('check') == '0' || doing) {return;};
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
        var code = '';
        if( s_simnew31.LastError!= 0 )
        {
            $('p.msg').text("未发现加密锁，请插入加密锁");
        }
        else
        {
            //获取锁的ID
            $('p.msg').text('找到加密狗,正在验证...'); 
            code = toHex(s_simnew31.GetID_1(DevicePath))+toHex(s_simnew31.GetID_2(DevicePath));
        }
        doing = true;
        $.ajax({
            type:'post',
            url:'index.php?exam-app-index-checkusbkey&code=' + code,
            success:function(html){
                if (html == '0') {
                    usb.data('check', '0');
                    $('p.msg').text('通过验证');
                    setTimeout(function(){$('#usbkey-check').modal('hide');}, 1000);
                }else{
                    code && $('p.msg').text('验证失败');
                };
                doing = false;
                incheck = false;
            },
            error:function(){
                doing = false;
                incheck = false;
            }
        });
    }
    catch(e)  
    {  
        $('p.msg').text(e.name + ": " + e.message+"。可能是没有安装相应的控件或插件");
    }
}, 1000);
}); 
})
</script>