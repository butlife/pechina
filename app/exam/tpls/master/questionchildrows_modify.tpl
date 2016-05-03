{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span2">
			{x2;include:menu}
		</div>
		<div class="span10" id="datacontent">
{x2;endif}
			<ul class="breadcrumb">
				<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a> <span class="divider">/</span></li>
				<li><a href="index.php?{x2;$_app}-master-rowsquestions&page={x2;$page}{x2;$u}">题冒题管理</a> <span class="divider">/</span></li>
				<li><a href="index.php?exam-master-rowsquestions-rowsdetail&questionid={x2;$questionparent}&page={x2;$page}{x2;$u}">子试题列表</a> <span class="divider">/</span></li>
				<li class="active">修改子试题</li>
			</ul>
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#">修改子试题</a>
				</li>
				<li class="pull-right">
					<a href="index.php?exam-master-rowsquestions-rowsdetail&questionid={x2;$questionparent}&page={x2;$page}{x2;$u}">子试题列表</a>
				</li>
			</ul>
			<form action="index.php?exam-master-rowsquestions-modifychildquestion" method="post" class="form-horizontal">
				<fieldset>
				<div class="control-group">
					<label class="control-label">题型：</label>
				  	<div class="controls">
					  	<select needle="needle" msg="您必须为要添加的试题选择一种题型" name="args[questiontype]" class="combox" onChange="javascript:setAnswerHtml($(this).find('option:selected').attr('rel'),'answerbox');">
					  		{x2;tree:$questypes,questype,qid}
					  		<option rel="{x2;if:v:questype['questsort']}0{x2;else}{x2;v:questype['questchoice']}{x2;endif}" value="{x2;v:questype['questid']}"{x2;if:v:questype['questid'] == $question['questiontype']} selected{x2;endif}>{x2;v:questype['questype']}</option>
					  		{x2;endtree}
					  	</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">题干：</label>
				  	<div class="controls">
					  	<textarea class="ckeditor" name="args[question]" id="question">{x2;$question['question']}</textarea>
					  	<span class="help-block">需要填空处请以()表示。</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">备选项：</label>
				  	<div class="controls">
					  	<textarea class="ckeditor" name="args[questionselect]" id="questionselect">{x2;$question['questionselect']}</textarea>
					  	<span class="help-block">无选择项的请不要填写，如填空题、问答题等主观题。</span>
					</div>
				</div>
				<div class="control-group" id="selectnumber">
					<label for="questionselectnumber" class="control-label">备选项数量：</label>
				  	<div class="controls">
					  	<select name="args[questionselectnumber]" id="questionselectnumber">
					  		<option value="0"{x2;if:$question['questionselectnumber'] == 0} selected{x2;endif}>0</option>
					  		<option value="2"{x2;if:$question['questionselectnumber'] == 2} selected{x2;endif}>2</option>
					  		<option value="4"{x2;if:$question['questionselectnumber'] == 4} selected{x2;endif}>4</option>
					  		<option value="5"{x2;if:$question['questionselectnumber'] == 5} selected{x2;endif}>5</option>
					  		<option value="6"{x2;if:$question['questionselectnumber'] == 6} selected{x2;endif}>6</option>
					  	</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">参考答案：</label>
					<div class="controls">
						<div id="answerbox_1" class="answerbox"{x2;if:$questypes[$question['questiontype']]['questchoice'] != 1} style="display:none;"{x2;endif}>
						  	<label class="radio inline"><input type="radio" name="targs[questionanswer1]" value="A"{x2;if:$question['questionanswer'] == 'A'} checked{x2;endif}>A</label>
						  	<label class="radio inline"><input type="radio" name="targs[questionanswer1]" value="B"{x2;if:$question['questionanswer'] == 'B'} checked{x2;endif}>B</label>
						  	<label class="radio inline"><input type="radio" name="targs[questionanswer1]" value="C"{x2;if:$question['questionanswer'] == 'C'} checked{x2;endif}>C</label>
						  	<label class="radio inline"><input type="radio" name="targs[questionanswer1]" value="D"{x2;if:$question['questionanswer'] == 'D'} checked{x2;endif}>D</label>
						  	<label class="radio inline"><input type="radio" name="targs[questionanswer1]" value="E"{x2;if:$question['questionanswer'] == 'E'} checked{x2;endif}>E</label>
						</div>
						<div id="answerbox_2" class="answerbox"{x2;if:$questypes[$question['questiontype']]['questchoice'] != 2} style="display:none;"{x2;endif}>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer2][]" value="A"{x2;if:strpos($question['questionanswer'],'A') !== false} checked{x2;endif}>A</label>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer2][]" value="B"{x2;if:strpos($question['questionanswer'],'B') !== false} checked{x2;endif}>B</label>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer2][]" value="C"{x2;if:strpos($question['questionanswer'],'C') !== false} checked{x2;endif}>C</label>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer2][]" value="D"{x2;if:strpos($question['questionanswer'],'D') !== false} checked{x2;endif}>D</label>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer2][]" value="E"{x2;if:strpos($question['questionanswer'],'E') !== false} checked{x2;endif}>E</label>
						</div>
						<div id="answerbox_3" class="answerbox"{x2;if:$questypes[$question['questiontype']]['questchoice'] != 3} style="display:none;"{x2;endif}>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer3][]" value="A"{x2;if:strpos($question['questionanswer'],'A') !== false} checked{x2;endif}>A</label>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer3][]" value="B"{x2;if:strpos($question['questionanswer'],'B') !== false} checked{x2;endif}>B</label>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer3][]" value="C"{x2;if:strpos($question['questionanswer'],'C') !== false} checked{x2;endif}>C</label>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer3][]" value="D"{x2;if:strpos($question['questionanswer'],'D') !== false} checked{x2;endif}>D</label>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer3][]" value="E"{x2;if:strpos($question['questionanswer'],'E') !== false} checked{x2;endif}>E</label>
						</div>
						<div id="answerbox_4" class="answerbox"{x2;if:$questypes[$question['questiontype']]['questchoice'] != 4} style="display:none;"{x2;endif}>
						  	<label class="radio inline"><input type="radio" name="targs[questionanswer4]" value="A"{x2;if:$question['questionanswer'] == 'A'} checked{x2;endif}>对</label>
						  	<label class="radio inline"><input type="radio" name="targs[questionanswer4]" value="B"{x2;if:$question['questionanswer'] == 'B'} checked{x2;endif}>错</label>
						</div>
						<div id="answerbox_5" class="answerbox"{x2;if:$questypes[$question['questiontype']]['questchoice'] != 5} style="display:none;"{x2;endif}>
							<ul>
								<li><select name="inorout" class="five_e">
				            			<option value="借">借</option>
				            			<option value="贷">贷</option>
				            		</select>
						            <select name="type" class="five_e">
                                        <optgroup label="一、资产类">
                                            <option value="库存现金">库存现金</option>
                                            <option value="银行存款">银行存款</option>
                                            <option value="其他货币资金">其他货币资金</option>
                                            <option value="存出保证金">存出保证金</option>
                                            <option value="交易性金融资产">交易性金融资产</option>
                                            <option value="应收票据">应收票据</option>
                                            <option value="应收账款">应收账款</option>
                                            <option value="预付账款">预付账款</option>
                                            <option value="应收股利">应收股利</option>
                                            <option value="应收利息">应收利息</option>
                                            <option value="其他应收款">其他应收款</option>
                                            <option value="坏账准备">坏账准备</option>
                                            <option value="材料采购">材料采购</option>
                                            <option value="在途物资">在途物资</option>
                                            <option value="原材料">原材料</option>
                                            <option value="材料成本差异">材料成本差异</option>
                                            <option value="库存商品">库存商品</option>
                                            <option value="发出商品">发出商品</option>
                                            <option value="委托加工物资">委托加工物资</option>
                                            <option value="周转材料">周转材料</option>
                                            <option value="融资租赁资产">融资租赁资产</option>
                                            <option value="存货跌价准备">存货跌价准备</option>
                                            <option value="持有至到期投资">持有至到期投资</option>
                                            <option value="持有至到期投资减值准备">持有至到期投资减值准备</option>
                                            <option value="可供出售金融资产">可供出售金融资产</option>
                                            <option value="长期股权投资">长期股权投资</option>
                                            <option value="长期股权投资减值准备">长期股权投资减值准备</option>
                                            <option value="投资性房地产">投资性房地产</option>
                                            <option value="长期应收款">长期应收款</option>
                                            <option value="固定资产">固定资产</option>
                                            <option value="累计折旧">累计折旧</option>
                                            <option value="固定资产减值准备">固定资产减值准备</option>
                                            <option value="在建工程">在建工程</option>
                                            <option value="工程物资">工程物资</option>
                                            <option value="定资产清理">定资产清理</option>
                                            <option value="无形资产">无形资产</option>
                                            <option value="累计摊销">累计摊销</option>
                                            <option value="无形资产减值准备">无形资产减值准备</option>
                                            <option value="长期待摊费用">长期待摊费用</option>
                                            <option value="待处理财产损溢">待处理财产损溢</option>
                                        </optgroup>
                                        <optgroup label="二、负债类">
                                            <option value="无形资产">无形资产</option>
                                            <option value="短期借款">短期借款</option>
                                            <option value="交易性金融负债">交易性金融负债</option>
                                            <option value="应付票据">应付票据</option>
                                            <option value="应付账款">应付账款</option>
                                            <option value="预收账款">预收账款</option>
                                            <option value="应付职工薪酬">应付职工薪酬</option>
                                            <option value="应交税费">应交税费</option>
                                            <option value="应付利息">应付利息</option>
                                            <option value="应付股利">应付股利</option>
                                            <option value="其他应付款">其他应付款</option>
                                            <option value="递延收益">递延收益</option>
                                            <option value="长期借款">长期借款</option>
                                            <option value="应付债券">应付债券</option>
                                            <option value="长期应付款">长期应付款</option>
                                        </optgroup>
                                        <optgroup label="三、所有者权益类">
                                            <option value="实收资本">实收资本</option>
                                            <option value="资本公积">资本公积</option>
                                            <option value="盈余公积">盈余公积</option>
                                            <option value="本年利润">本年利润</option>
                                            <option value="利润分配">利润分配</option>
                                            <option value="库存股">库存股</option>   
                                        </optgroup>    	       
                                        <optgroup label="四、成本类">
                                            <option value="生产成本">生产成本</option>
                                            <option value="制造费用">制造费用</option>
                                            <option value="劳务成本">劳务成本</option>
                                            <option value="研发支出">研发支出</option>
                                        </optgroup>    	
                                        <optgroup label="五、损益类">
                                            <option value="主营业务收入">主营业务收入</option> 
                                            <option value="利息收入">利息收入</option>      
                                            <option value="租赁收入">租赁收入</option>      
                                            <option value="其他业务收入">其他业务收入</option>
                                            <option value="公允价值变动损益">公允价值变动损益</option>
                                            <option value="投资收益">投资收益</option>       
                                            <option value="营业外收入">营业外收入</option>    
                                            <option value="主营业务成本">主营业务成本</option>
                                            <option value="其他业务成本">其他业务成本</option>
                                            <option value="营业税金及附加">营业税金及附加</option>  
                                            <option value="利息支出">利息支出</option>       
                                            <option value="销售费用">销售费用</option>        
                                            <option value="管理费用">管理费用</option>        
                                            <option value="财务费用">财务费用</option>        
                                            <option value="资产减值损失">资产减值损失</option>    
                                            <option value="营业外支出">营业外支出</option>      
                                            <option value="所得税费用">所得税费用</option>      
                                            <option value="以前年度损益调整">以前年度损益调整</option>
                                        </optgroup>    
						            </select>
								<input type="text" class="five_e" name="valule">
                                </li>
							</ul>
							<a href="javascript:;" class="btnAdd">增加一个</a>
						  	<input type="text" size="80" style="width:560px;" class="five" name="targs[questionanswer5]" value="{x2;$question['questionanswer']}"/>
						</div>
						<div id="answerbox_6" class="answerbox"{x2;if:$questypes[$question['questiontype']]['questchoice'] != 6} style="display:none;"{x2;endif}>
						  	<input type="text" name="targs[questionanswer6]" value="{x2;$question['questionanswer']}" />
						</div>
						<div id="answerbox_0"{x2;if:!$questypes[$question['questiontype']]['questsort']} style="display:none;"{x2;endif} class="answerbox">
					  		<textarea cols="72" rows="7" class="ckeditor" id="questionanswer0" name="targs[questionanswer0]">{x2;$question['questionanswer']}</textarea>
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">习题解析：</label>
				  	<div class="controls">
				  		<textarea class="ckeditor" name="args[questiondescribe]" id="questiondescribe">{x2;$question['questiondescribe']}</textarea>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">难度：</label>
				  	<div class="controls">
					  	<select class="combox" name="args[questionlevel]" needle="needle" msg="您必须为要添加的试题设置一个难度">
					  		<option value="1"{x2;if:$question['questionlevel']==1} selected{x2;endif}>易</option>
					  		<option value="2"{x2;if:$question['questionlevel']==2} selected{x2;endif}>中</option>
					  		<option value="3"{x2;if:$question['questionlevel']==3} selected{x2;endif}>难</option>
					  	</select>
					</div>
				</div>
				<div class="control-group">
				  	<div class="controls">
					  	<button class="btn btn-primary" type="submit">提交</button>
					  	<input type="hidden" name="page" value="{x2;$page}"/>
						<input type="hidden" name="args[questionparent]" value="{x2;$questionparent}"/>
						<input type="hidden" name="questionid" value="{x2;$question['questionid']}"/>
						<input type="hidden" name="modifyquestion" value="1"/>
						{x2;tree:$search,arg,aid}
						<input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
						{x2;endtree}
					</div>
				</div>
				</fieldset>
			</form>
{x2;if:!$userhash}
		</div>
	</div>
</div>
<div style="display:none;" id="selectVal">
    <optgroup label="一、资产类">
        <option value="库存现金">库存现金</option>
        <option value="银行存款">银行存款</option>
        <option value="其他货币资金">其他货币资金</option>
        <option value="存出保证金">存出保证金</option>
        <option value="交易性金融资产">交易性金融资产</option>
        <option value="应收票据">应收票据</option>
        <option value="应收账款">应收账款</option>
        <option value="预付账款">预付账款</option>
        <option value="应收股利">应收股利</option>
        <option value="应收利息">应收利息</option>
        <option value="其他应收款">其他应收款</option>
        <option value="坏账准备">坏账准备</option>
        <option value="材料采购">材料采购</option>
        <option value="在途物资">在途物资</option>
        <option value="原材料">原材料</option>
        <option value="材料成本差异">材料成本差异</option>
        <option value="库存商品">库存商品</option>
        <option value="发出商品">发出商品</option>
        <option value="委托加工物资">委托加工物资</option>
        <option value="周转材料">周转材料</option>
        <option value="融资租赁资产">融资租赁资产</option>
        <option value="存货跌价准备">存货跌价准备</option>
        <option value="持有至到期投资">持有至到期投资</option>
        <option value="持有至到期投资减值准备">持有至到期投资减值准备</option>
        <option value="可供出售金融资产">可供出售金融资产</option>
        <option value="长期股权投资">长期股权投资</option>
        <option value="长期股权投资减值准备">长期股权投资减值准备</option>
        <option value="投资性房地产">投资性房地产</option>
        <option value="长期应收款">长期应收款</option>
        <option value="固定资产">固定资产</option>
        <option value="累计折旧">累计折旧</option>
        <option value="固定资产减值准备">固定资产减值准备</option>
        <option value="在建工程">在建工程</option>
        <option value="工程物资">工程物资</option>
        <option value="定资产清理">定资产清理</option>
        <option value="无形资产">无形资产</option>
        <option value="累计摊销">累计摊销</option>
        <option value="无形资产减值准备">无形资产减值准备</option>
        <option value="长期待摊费用">长期待摊费用</option>
        <option value="待处理财产损溢">待处理财产损溢</option>
    </optgroup>
    <optgroup label="二、负债类">
        <option value="无形资产">无形资产</option>
        <option value="短期借款">短期借款</option>
        <option value="交易性金融负债">交易性金融负债</option>
        <option value="应付票据">应付票据</option>
        <option value="应付账款">应付账款</option>
        <option value="预收账款">预收账款</option>
        <option value="应付职工薪酬">应付职工薪酬</option>
        <option value="应交税费">应交税费</option>
        <option value="应付利息">应付利息</option>
        <option value="应付股利">应付股利</option>
        <option value="其他应付款">其他应付款</option>
        <option value="递延收益">递延收益</option>
        <option value="长期借款">长期借款</option>
        <option value="应付债券">应付债券</option>
        <option value="长期应付款">长期应付款</option>
    </optgroup>
    <optgroup label="三、所有者权益类">
        <option value="实收资本">实收资本</option>
        <option value="资本公积">资本公积</option>
        <option value="盈余公积">盈余公积</option>
        <option value="本年利润">本年利润</option>
        <option value="利润分配">利润分配</option>
        <option value="库存股">库存股</option>   
    </optgroup>    	       
    <optgroup label="四、成本类">
        <option value="生产成本">生产成本</option>
        <option value="制造费用">制造费用</option>
        <option value="劳务成本">劳务成本</option>
        <option value="研发支出">研发支出</option>
    </optgroup>    	
    <optgroup label="五、损益类">
        <option value="主营业务收入">主营业务收入</option> 
        <option value="利息收入">利息收入</option>      
        <option value="租赁收入">租赁收入</option>      
        <option value="其他业务收入">其他业务收入</option>
        <option value="公允价值变动损益">公允价值变动损益</option>
        <option value="投资收益">投资收益</option>       
        <option value="营业外收入">营业外收入</option>    
        <option value="主营业务成本">主营业务成本</option>
        <option value="其他业务成本">其他业务成本</option>
        <option value="营业税金及附加">营业税金及附加</option>  
        <option value="利息支出">利息支出</option>       
        <option value="销售费用">销售费用</option>        
        <option value="管理费用">管理费用</option>        
        <option value="财务费用">财务费用</option>        
        <option value="资产减值损失">资产减值损失</option>    
        <option value="营业外支出">营业外支出</option>      
        <option value="所得税费用">所得税费用</option>      
        <option value="以前年度损益调整">以前年度损益调整</option>
    </optgroup>    
</div>
<script type="text/javascript">
	$().ready(function(){
		$('#answerbox_5').on('change',function(){
			setValue();
		});

	$('.btnAdd').click(function(){
		var template = '<li class="item"><select name="inorout" class="five_e"><option value="借">借</option><option value="贷">贷</option></select>';
		template = template + '<select name="type" class="five_e">'+ $('#selectVal').html() + '</select>';
		template = template +  '<input type="text" class="five_e" name="valule"><a class="btnDelete" href="javascript:;">删除</a></li>';
		$(template).appendTo($('#answerbox_5').find('ul'));
		setValue();
	});

	$(document).on('click', '.btnDelete', function(){
		$(this).parents('li').remove();
		setValue();
	});

	function setValue(){
		var arrdata = new Array();
		$('#answerbox_5').find('li').each(function(){
			var _this = $(this);
			var inorout = _this.find('select[name="inorout"]').val();
			var type = _this.find('select[name="type"]').val();
			var valule = _this.find('input[name="valule"]').val();
			arrdata.push(inorout + '|' + type + '|' + valule);
		});
		arrdata.sort();
		$('input.five').val(arrdata.join('#'));
	}
	});
</script>
</body>
</html>
{x2;endif}