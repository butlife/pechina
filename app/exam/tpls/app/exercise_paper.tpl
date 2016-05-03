{x2;include:header}
<body>
<script src="app/exam/styles/js/plugin.js"></script>
<script type="text/javascript">
$(function(){
	$(".showAnswerBtn").click(function() {
		var id = $(this).attr("val");
		$(this).hide(5);
		$("#ans_" + id).show(300);
		$("#HideAnswerBtn_" + id).show(5);
	});
	
	$(".HideAnswerBtn").click(function() {
		var id = $(this).attr("val");
		$(this).hide(5);
		$("#showAnswerBtn_" + id).show(300);
		$("#ans_" + id).hide(5);
	});
});
</script>
{x2;include:nav}
<div class="row-fluid">
	<div class="container examcontent">
		<div class="exambox" id="datacontent">
			<form class="examform form-horizontal" id="form1" name="form1" action="index.php?exam-app-exercise-score">
				<ul class="breadcrumb">
					<li>
						<span class="icon-home"></span> <a href="index.php">考场选择</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="index.php?exam-app-basics">{x2;$data['currentbasic']['basic']}</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="index.php?exam-app-exercise">强化训练</a> <span class="divider">/</span>
					</li>
					<li class="active">
						{x2;$sessionvars['examsession']}
					</li>
				</ul>
				<h3 class="text-center">{x2;$sessionvars['examsession']}</h3>
				{x2;eval: v:oid = 0}
				{x2;tree:$questype,quest,qid}
				{x2;if:$sessionvars['examsessionquestion']['questions'][v:quest['questid']] || $sessionvars['examsessionquestion']['questionrows'][v:quest['questid']]}
				{x2;eval: v:oid++}
				<div id="panel-type{x2;v:quest['questid']}" class="tab-pane{x2;if:(!$ctype && v:qid == 1) || ($ctype == v:quest['questid'])} active{x2;endif}">
					<ul class="breadcrumb">
						<li>
							<h5>{x2;v:oid}、{x2;v:quest['questype']}</h5>
						</li>
					</ul>
					{x2;eval: v:tid = 0}
	                {x2;tree:$sessionvars['examsessionquestion']['questions'][v:quest['questid']],question,qnid}
	                {x2;eval: v:tid++}
	                <div id="question_{x2;v:question['questionid']}" class="paperexamcontent">
						<div class="media well">
							<ul class="nav nav-tabs">
								<li class="active">
									<span class="badge badge-info questionindex">{x2;v:tid}</span></a>
								</li>
								<li class="btn-group pull-right">
									<button class="btn" type="button" onClick="javascript:signQuestion('{x2;v:question['questionid']}',this);"><em class="{x2;if:$sessionvars['examsessionsign'][v:question['questionid']]}icon-star{x2;else}icon-star-empty{x2;endif}" title="标注"></em></button>
									<button class="btn" type="button" onClick="javascript:favorquestion('{x2;v:question['questionid']}');"><em class="icon-heart" title="收藏"></em></button>
								</li>
							</ul>
							<div class="media-body well text-warning">
								<a name="question_{x2;v:question['questionid']}"></a>{x2;realhtml:v:question['question']}
							</div>
							{x2;if:!v:quest['questsort']}
							<div class="media-body well">
		                    	{x2;realhtml:v:question['questionselect']}
		                    </div>
							<div class="media-body well">
		                    	{x2;if:v:quest['questchoice'] == 1 || v:quest['questchoice'] == 4 || v:quest['questchoice'] == 5}
			                        {x2;tree:$selectorder,so,sid}
			                        {x2;if:v:key == v:question['questionselectnumber']}
			                        {x2;eval: break;}
			                        {x2;endif}
			                        <label class="radio inline"><input type="radio" name="question[{x2;v:question['questionid']}]" rel="{x2;v:question['questionid']}" value="{x2;v:so}" {x2;if:v:so == $sessionvars['examsessionuseranswer'][v:question['questionid']]}checked{x2;endif}/>{x2;v:so} </label>
			                        {x2;endtree}
		                        {x2;else}
			                        {x2;tree:$selectorder,so,sid}
			                        {x2;if:v:key >= v:question['questionselectnumber']}
			                        {x2;eval: break;}
			                        {x2;endif}
			                        <label class="checkbox inline"><input type="checkbox" name="question[{x2;v:question['questionid']}][{x2;v:key}]" rel="{x2;v:question['questionid']}" value="{x2;v:so}" {x2;if:in_array(v:so,$sessionvars['examsessionuseranswer'][v:question['questionid']])}checked{x2;endif}/>{x2;v:so} </label>
			                        {x2;endtree}
		                        {x2;endif}
								<input type='button' class="showAnswerBtn" id="showAnswerBtn_{x2;v:question['questionid']}" val="{x2;v:question['questionid']}" value='显示答案'>
								<input type='button' class="HideAnswerBtn" id="HideAnswerBtn_{x2;v:question['questionid']}" style="display:none;" val="{x2;v:question['questionid']}" value='隐藏答案'>
								<div class="media-body well answerDiv" id="ans_{x2;v:question['questionid']}" style="display:none;">
		                        	<div class="text-error">正确答案：{x2;realhtml:v:question['questionanswer']}</div>
					<div class="text-info">答案解析：</div>
		                        	<div class="text-success">{x2;realhtml:v:question['questiondescribe']}</div>
		                    </div>
		                    </div>
							{x2;else}
							<div class="media-body well">
								{x2;eval: $dataid = v:question['questionid']}
								<textarea class="jckeditor" etype="simple" id="editor{x2;$dataid}" name="question[{x2;$dataid}]" rel="{x2;v:question['questionid']}">{x2;realhtml:$sessionvars['examsessionuseranswer'][$dataid]}</textarea>
							</div>
							{x2;endif}
						</div>
					</div>
					{x2;endtree}
					{x2;tree:$sessionvars['examsessionquestion']['questionrows'][v:quest['questid']],questionrow,qrid}
	                {x2;eval: v:tid++}
	                <div id="questionrow_{x2;v:questionrow['qrid']}">
						<div class="media well">
							<ul class="nav nav-tabs">
								<li class="active">
									<span class="badge badge-info questionindex">{x2;v:tid}</span>
								</li>
							</ul>
							<div class="media-body well">
								{x2;realhtml:v:questionrow['qrquestion']}
							</div>
							{x2;tree:v:questionrow['data'],data,did}
							<div class="paperexamcontent">
								<ul class="nav nav-tabs">
									<li class="active">
										<span class="badge questionindex">{x2;v:did}</span></a>
									</li>
									<li class="btn-group pull-right">
										<button class="btn" type="button" onClick="javascript:signQuestion('{x2;v:data['questionid']}',this);"><em class="{x2;if:$sessionvars['examsessionsign'][v:data['questionid']]}icon-star{x2;else}icon-star-empty{x2;endif}" title="标注"></em></button>
										<button class="btn" type="button" onClick="javascript:favorquestion('{x2;v:data['questionid']}');"><em class="icon-heart" title="收藏"></em></button>
									</li>
								</ul>
								<div class="media-body well text-warning">
									<a name="question_{x2;v:data['questionid']}"></a>{x2;realhtml:v:data['question']}
								</div>
								{x2;if:!v:quest['questsort']}
								<div class="media-body well">
			                    	{x2;realhtml:v:data['questionselect']}
			                    </div>
								<div class="media-body well">
			                    	{x2;if:v:quest['questchoice'] != 5 && v:quest['questchoice'] != 6}
				                        {x2;tree:$selectorder,so,sid}
				                        {x2;if:v:key == v:data['questionselectnumber']}
				                        {x2;eval: break;}
				                        {x2;endif}
				                        <label class="checkbox inline"><input type="checkbox" name="question[{x2;v:data['questionid']}]" rel="{x2;v:data['questionid']}" value="{x2;v:so}" {x2;if:v:so == $sessionvars['examsessionuseranswer'][v:data['questionid']]}checked{x2;endif}/>{x2;v:so} </label>
				                        {x2;endtree}
			                        {x2;elseif:v:quest['questchoice'] == 6}
				                        <input type="text" name="question[{x2;v:data['questionid']}]" class="input-large" rel="{x2;v:data['questionid']}" value=""/>
				            {x2;elseif:v:quest['questchoice'] == 5}
				            <ul class='answerbox_5'>
								<li class="item"><select name="inorout" class="five_e">
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
                                <a href="javascript:;" class="btnAdd">增加一个</a>
                                <input type="hidden" name="question[{x2;v:data['questionid']}]" class="input-large five" rel="{x2;v:data['questionid']}" value=""/>
							</ul>
			                        {x2;else}
				                        {x2;tree:$selectorder,so,sid}
				                        {x2;if:v:key >= v:data['questionselectnumber']}
				                        {x2;eval: break;}
				                        {x2;endif}
				                        <label class="checkbox inline"><input type="checkbox" name="question[{x2;v:data['questionid']}][{x2;v:key}]" rel="{x2;v:data['questionid']}" value="{x2;v:so}" {x2;if:in_array(v:so,$sessionvars['examsessionuseranswer'][v:data['questionid']])}checked{x2;endif}/>{x2;v:so} </label>
				                        {x2;endtree}
			                        {x2;endif}
			                    </div>
								{x2;else}
								<div class="media-body well">
									{x2;eval: $dataid = v:data['questionid']}
									<textarea class="jckeditor" etype="simple" id="editor{x2;$dataid}" name="question[{x2;$dataid}]" rel="{x2;v:data['questionid']}">{x2;realhtml:$sessionvars['examsessionuseranswer'][$dataid]}</textarea>
								</div>
								{x2;endif}
							</div>
							{x2;endtree}
						</div>
					</div>
					{x2;endtree}
				</div>
				{x2;endif}
				{x2;endtree}
				<div aria-hidden="true" id="submodal" class="modal hide fade" role="dialog" aria-labelledby="#mySubModalLabel">
					<div class="modal-header">
						<button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
						<h3 id="mySubModalLabel">
							交卷
						</h3>
					</div>
					<div class="modal-body" id="modal-body" style="max-height:100%;">
						<p>共有试题 <span class="allquestionnumber">50</span> 题，已做 <span class="yesdonumber">0</span> 题。您确认要交卷吗？</p>
					</div>
					<div class="modal-footer">
						 <button onClick="javascript:submitPaper();" class="btn btn-primary">确定交卷</button>
						 <input type="hidden" name="insertscore" value="1"/>
						 <button aria-hidden="true" class="btn" data-dismiss="modal">再检查一下</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<div aria-hidden="true" id="modal" class="modal hide fade" role="dialog" aria-labelledby="#myModalLabel">
	<div class="modal-header">
		<button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
		<h3 id="myModalLabel">
			试题列表
		</h3>
	</div>
	<div class="modal-body" id="modal-body" style="max-height:100%;">
		{x2;eval: v:oid = 0}
    	{x2;tree:$questype,quest,qid}
    	{x2;if:$sessionvars['examsessionquestion']['questions'][v:quest['questid']] || $sessionvars['examsessionquestion']['questionrows'][v:quest['questid']]}
        {x2;eval: v:oid++}
        <dl class="clear">
        	<dt class="float_l"><b>{x2;v:oid}、{x2;v:quest['questype']}</b></dt>
            <dd>
            	{x2;eval: v:tid = 0}
                {x2;tree:$sessionvars['examsessionquestion']['questions'][v:quest['questid']],question,qnid}
                {x2;eval: v:tid++}
            	<a id="sign_{x2;v:question['questionid']}" href="#question_{x2;v:question['questionid']}" rel="0" class="badge questionindex{x2;if:$sessionvars['examsessionsign'][v:question['questionid']]} signBorder{x2;endif}">{x2;v:tid}</a>
            	{x2;endtree}
            	{x2;tree:$sessionvars['examsessionquestion']['questionrows'][v:quest['questid']],questionrow,qrid}
                {x2;eval: v:tid++}
                {x2;tree:v:questionrow['data'],data,did}
				<a id="sign_{x2;v:data['questionid']}" href="#question_{x2;v:data['questionid']}" rel="0" class="badge questionindex{x2;if:$sessionvars['examsessionsign'][v:data['questionid']]} signBorder{x2;endif}">{x2;v:tid}-{x2;v:did}</a>
                {x2;endtree}
                {x2;endtree}
            </dd>
        </dl>
        {x2;endif}
        {x2;endtree}
	</div>
	<div class="modal-footer">
		 <button aria-hidden="true" class="btn" data-dismiss="modal">隐藏</button>
	</div>
</div>
<div class="row-fluid">
	<div class="container toolcontent">
		<div class="footcontent">
			<div class="span2">
				<ul class="unstyled">
					<li><h4><img src="app/core/styles/images/icons/Watches.png" style="width:1.2em;"/> <span id="timer_h">00</span>：<span id="timer_m">00</span>：<span id="timer_s">00</span></h4></li>
				</ul>
			</div>
			<div class="span2">
				<ul class="unstyled">
					<li><h6><a href="#top"><em class="icon-circle-arrow-up"></em>回顶部</a> &nbsp; <a href="#modal" data-toggle="modal"><em class="icon-calendar"></em>试题列表</a></h6></li>
				</ul>
			</div>
			<div class="span6">
				<ul class="unstyled">
					<li><h6>已做 <span class="yesdonumber">0</span> 题 共 <span class="allquestionnumber">50</span> 题 总分：<span class="orange">100</span>分 合格分数线：<span class="orange">60</span>分 考试时间：<span class="orange">60</span>分钟</h6></li>
				</ul>
			</div>
			<div class="span2">
				<ul class="unstyled">
					<li class="text-right"><a href="#submodal" role="button" class="btn btn-primary" data-toggle="modal"> 交 卷 </a></li>
				</ul>
			</div>
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
$(document).ready(function(){
	$.get('index.php?exam-app-index-ajax-lefttime&rand'+Math.random(),function(data){
		var setting = {
			time:{x2;$sessionvars['examsessiontime']},
			hbox:$("#timer_h"),
			mbox:$("#timer_m"),
			sbox:$("#timer_s"),
			finish:function(){submitPaper();}
		}
		setting.lefttime = parseInt(data);
		countdown(setting);
	});
	setInterval(refreshRecord,5000);
	setInterval(saveanswer,300000);

	$('.allquestionnumber').html($('.paperexamcontent').length);
	$('.yesdonumber').html($('#modal-body .badge-info').length);

	initData = $.parseJSON(storage.getItem('questions'));
	if(initData){
		for(var p in initData){
			if(p!='set')
			formData[p]=initData[p];
		}

		var textarea = $('#form1 textarea');
		$.each(textarea,function(){
			var _this = $(this);
			_this.val(initData[_this.attr('name')]);
			CKEDITOR.instances[_this.attr('id')].setData(initData[_this.attr('name')]);
			markQuestion(_this.attr('rel'),true);
		});

		var texts = $('#form1 :input[type=text]');
		$.each(texts,function(){
			var _this = $(this);
			_this.val(initData[_this.attr('name')]);
			markQuestion(_this.attr('rel'),true);
		});

		var radios = $('#form1 :input[type=radio]');
		$.each(radios,function(){
			var _= this, v = initData[_.name];
			var _this = $(this);
			if(v!=''&&v==_.value){
				_.checked = true;
			}else{
				_.checked=false;
			}
			markQuestion(_this.attr('rel'));
		});

		var checkboxs=$('#form1 :input[type=checkbox]');
		$.each(checkboxs,function(){
			var _=this,v=initData[_.name];
			var _this = $(this);
			if(v!=''&&v==_.value){
				_.checked=true;
			}else{
				_.checked=false;
			}
			markQuestion(_this.attr('rel'));
		});
	}

	$('#form1 :input[type=text]').change(function(){
		var _this=$(this);
		var p=[];
		p.push(_this.attr('name'));
		p.push(_this.val());
		set.apply(formData,p);
		markQuestion(_this.attr('rel'));
	});

	$('#form1 :input[type=radio]').change(function(){
		var _=this;
		var _this=$(this);
		var p=[];
		p.push(_.name);
		if(_.checked){
			p.push(_.value);
			set.apply(formData,p);
		}else{
			p.push('');
			set.apply(formData,p);
		}
		markQuestion(_this.attr('rel'));
	});

	$('#form1 textarea').change(function(){
		var _= this;
		var _this=$(this);
		var p=[];
		p.push(_.name);
		p.push(_.value);
		set.apply(formData,p);
		markQuestion(_this.attr('rel'));
	});

	$('#form1 :input[type=checkbox]').change(function(){
		var _= this;
		var _this = $(this);
		var p=[];
		p.push(_.name);
		if(_.checked){
			p.push(_.value);
			set.apply(formData,p);
		}else{
			p.push('');
			set.apply(formData,p);
		}
		markQuestion(_this.attr('rel'));
	});

	$().ready(function(){
		$(document).on('change', '.five_e', function(){
			setValue($(this).parents('ul.answerbox_5'));
		});

	$('.btnAdd').click(function(){
		var template = '<li class="item"><select name="inorout" class="five_e"><option value="借">借</option><option value="贷">贷</option></select>';
		template = template + '<select name="type" class="five_e">'+ $('#selectVal').html() + '</select>';
		template = template +  '<input type="text" class="five_e" name="valule"><a class="btnDelete" href="javascript:;">删除</a></li>';
		$(template).insertAfter($(this).parents('ul.answerbox_5').find('li').slice(-1));
		setValue($(this).parents('ul.answerbox_5'));
	});

	$(document).on('click', '.btnDelete', function(){
		var box = $(this).parents('ul.answerbox_5');
		$(this).parent('li').remove();
		setValue(box);
	});

	function setValue(box){
		var arrdata = new Array();
		box.find('li.item').each(function(){
			var _this = $(this);
			var inorout = _this.find('select[name="inorout"]').val();
			var type = _this.find('select[name="type"]').val();
			var valule = _this.find('input[name="valule"]').val();
			arrdata.push(inorout + '|' + type + '|' + valule);
		});
		arrdata.sort();
		box.find('input.five').val(arrdata.join('#'));
	}
	});
});
</script>
{x2;include:foot}
</body>
</html>