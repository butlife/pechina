<ul class="nav nav-tabs nav-stacked">
	<li{x2;if:$method == 'index'} class="active"{x2;endif}>
		<a href="index.php?user-app">首页</a>
	</li>
	<li{x2;if:$method == 'privatement'} class="active"{x2;endif}>
		<a href="index.php?user-center-privatement">隐私管理</a>
	</li>
	<li{x2;if:$method == 'payfor'} class="active"{x2;endif}>
		<!--<a href="index.php?user-center-payfor">充值积分</a>-->
	</li>
</ul>