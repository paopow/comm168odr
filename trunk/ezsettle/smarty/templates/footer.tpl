
		</div><!-- end container -->
		<div class="footer">&copy; EZSettle 2000-2010</div>
		<script type="text/javascript">
		{literal}
			//<![CDATA[
		$(".chat").each(function(index) {
			var time = $(this).attr("id") * 2500;
			var elem = $(this);
			setTimeout(function() { $(elem).show(); $("#chatbox").scrollTo($(elem)); }, time);
		});
		//]]>
		{/literal}
		</script>
 	</body>
</html>
