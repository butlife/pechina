var storage = window.localStorage;
var initData = {};
var formData = {};

function set(k,v){
	var _this = this;
	if(typeof(_this) == "object"&& Object.prototype.toString.call(_this).toLowerCase() == "[object object]" && !_this.length){
		_this[k] = v;
		storage.setItem('questions',$.toJSON(formData));
	}
}

function submitPaper()
{
	storage.removeItem('questions');
	$('#submodal').modal('hide');
	$('#form1').submit();
}

function refreshRecord(){
	$('#form1 :input[type=text]').each(function(){
		var _= this;
		var _this=$(this);
		var p=[];
		p.push(_.name);
		p.push(_.value);
		set.apply(formData,p);
		markQuestion(_this.attr('rel'),true);
	});
	$('#form1 textarea').each(function(){
		var _= this;
		var _this=$(this);
		var p=[];
		for ( instance in CKEDITOR.instances )
		CKEDITOR.instances[instance].updateElement();
		p.push(_.name);
		p.push(_.value);
		set.apply(formData,p);
		markQuestion(_this.attr('rel'),true);
	});
}

function saveanswer(){
	var params = $(':input').serialize();
	$.ajax({
	   url:'index.php?exam-app-exam-ajax-saveUserAnswer',
	   async:false,
	   type:'post',
	   dataType:'json',
	   data:params
	});
}

function markQuestion(rel,isTextArea)
{
	var t = 0;
	if(isTextArea)
	{
		if($('#form1 :input[rel='+rel+']').val() && $('#form1 :input[rel='+rel+']').val() != '' && $('#form1 :input[rel='+rel+']').val() != '<p></p>')t++;
	}
	else
	$('#form1 :input[rel='+rel+']').each(function(){if($(this).is(':checked') && $(this).val() && $(this).val() != '' && $(this).val() != '<p></p>')t++;});
	if(t > 0)
	{
		if(!$('#sign_'+rel).hasClass("badge-info"))$('#sign_'+rel).addClass("badge-info");
	}
	else
	{
		$('#sign_'+rel).removeClass("badge-info");
	}
	$('.yesdonumber').html($('#modal-body .badge-info').length);
}

function signQuestion(id,obj)
{
	$.get("index.php?exam-app-index-ajax-sign&questionid="+id+'&'+Math.random(),function(data){if(parseInt(data) != 1){$('#sign_'+id).removeClass('signBorder');$(obj).children("em").attr("class","icon-star-empty");}else{$('#sign_'+id).addClass('signBorder');$(obj).children("em").attr("class","icon-star");}});
}

function favorquestion(questionid){
	$.get("index.php?exam-app-favor-ajax-addfavor&questionid="+questionid+'&'+Math.random(),function(){alert('收藏成功');});
}

function delfavorquestion(questionid){
	$.get("index.php?exam-app-favor-ajax-delfavor&questionid="+questionid+'&'+Math.random(),function(){alert('删除成功');window.location.reload();});
}