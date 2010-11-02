{include file="header.tpl"}
<div class="main_body">
	<div class="loud headline append-bottom">{ $offer_title}</div>
	<div class="span-24 last">
	{include file="chat_notice.tpl"}

		<div class="span-24 last">
		<div class="error hide" id="errors">Please fill in the following fields:</div>
		<form id="offer" name="ofer" method="post" action="actions/postoffer.php">
			<input type="hidden" name="offer_num" value="{$offer_num}" />
			<table style="padding: 10px;">
				<tr>
					<th style="width:300px;">Issues:</th>
					{if $offer_num > 1}
					<th style="width:200px;"><div style="float: right; width:200px; text-align: right;">Your Previous<br/>Offer:</div></th>
					<th style="width:200px;"><div style="float: right; width:200px; text-align: right;">Casey's<br/>Counteroffer:</div></th>
					<th style="width:200px;"><div style="float: right; width:200px; text-align: right;">Your New<br/>Offer:</div></th>
					{else}
					<th style="width:200px;"><div style="float: right; width:200px;"></div></th>
					<th style="width:200px;"><div style="float: right; width:200px;"></div></th>
					<th style="width:200px;"><div style="float: right; width:200px; text-align: right;">Your First Offer:</div></th>
					{/if}

				</tr>
				{section name=issuesIndex loop=$issues}
					{ if $smarty.section.issuesIndex.index%2 == 0}
						<tr class="even" id="row{$smarty.section.issuesIndex.index}">
					{else}
						<tr id="row{$smarty.section.issuesIndex.index}">
					{/if}
					<td><div id="issueslabel{$smarty.section.issuesIndex.index}">{ $issues[issuesIndex] }</div></td>
					{if $offer_num > 1}
						<td><div style="float: right;">
							{if $smarty.section.issuesIndex.index == 0}
								<input type="radio" name="issues0" value="Yes" disabled="yes" {if $offers[0]=="Yes"}checked="yes"{/if} />Yes 
								<input type="radio" name="issues0" value="No" disabled="yes" {if $offers[0]=="No"}checked="yes"{/if} />No
							{elseif $smarty.section.issuesIndex.index == 5}
								<input type="radio" name="issues5" value="buyer" disabled="yes" {if $offers[5]=="buyer"}checked="yes"{/if } />Buyer
								<input type="radio" name="issues5" value="seller" disabled="yes" {if $offers[5]=="seller"}checked="yes"{/if}/>Seller
							{else}
								$<input type="text" size="10" maxlength="10" disabled="yes" name="issues{$smarty.section.issuesIndex.index}" value="{$offers[issuesIndex]}" />
							{/if}
							</div>
						</td>
						
						<td><div style="float: right;">
							{if $smarty.section.issuesIndex.index == 0}
								<input type="radio" name="c_issue0" value="Yes" disabled="yes" {if $counteroffers[0]=="Yes"}checked{/if}>Yes 
								<input type="radio" name="c_issue0" value="No" disabled="yes" {if $counteroffers[0]=="No"}checked{/if}>No
							{elseif $smarty.section.issuesIndex.index == 5}
								<input type="radio" name="issues5" value="buyer" disabled="yes" {if $counteroffers[5]=="buyer"}checked="yes"{/if}/>Buyer <input type="radio" name="issues5" value="seller" disabled="yes" {if $counteroffers[5]=="seller"}checked="yes"{/if}/>Seller
							{else}
								$<input type="text" size="10" maxlength="10" disabled="yes" name="c_issues{$smarty.section.issuesIndex.index}" value="{$counteroffers[issuesIndex]}" />
							{/if}
							</div>
						</td>
					{else}
						<td></td>
						<td></td>
					{/if}
					<td><div style="float: right;">
					{if $smarty.section.issuesIndex.index == 0}
						<input type="radio" name="issues0" value="Yes">Yes <input type="radio" name="issues0" value="No">No
					{elseif $smarty.section.issuesIndex.index == 5}
						<input type="radio" name="issues5" value="buyer">Buyer <input type="radio" name="issues5" value="seller">Seller
					{else}
						$<input type="text" size="10" maxlength="10" id="issues{$smarty.section.issuesIndex.index}" name="issues{$smarty.section.issuesIndex.index}" value="" />
					{/if}
					</div>
					</td>
					</tr>
				{/section}
				<tr><td colspan="4"><hr/></td></tr>
				<tr><td colspan="4" class="loud headline">Comments:</td></tr>
					<tr><td colspan="2">Comments {$mediator} should pass to Casey345:</td><td colspan="2"><div style="float: right;"><textarea rows="3" cols="40" name="casey" value="" ></textarea></div></td></tr>
					<tr><td colspan="2">Comments for {$mediator}:<br/>
					<span class="quiet">(These will not be shown to Casey345)</span></td>
					<td colspan="2"><div style="float: right;"><textarea rows="3" cols="40" name="mediator" value="" ></textarea></div></td></tr>
					<tr><td colspan="4"><div style="float: right;"><input type="submit" class="super large awesome red button" name="submit" value="Make offer" /></div></td></tr>
			</table>
		</form>
		</div>

	</div>
	{include file="chat.tpl"}
	<div class="loading" id="loading">
		<div class="loud headline"><img class="loader" id="loader" src="images/loader_big.gif" />Thanks for waiting...</div>
		Please wait while {$mediator} communicates your offer to Casey345.<br/>
		{$mediator_caps} will come back to you with Casey345's response and/or counteroffer.
		<br/><div style="clear:both; height: 1px;"></div>
		{if $condition == 1 || $condition == 2 || $condition == 5}
		<img id="diagram" src="images/diagram-computer.jpg"/>
		{else}
		<img id="diagram" src="images/diagram-human.jpg"/>
		{/if}
		<div style="clear:both; height: 1px;"></div>
	</div><!-- end loading -->
</div><!-- end main body -->

<script type="text/javascript">
{literal}
	//<![CDATA[
	 $(document).ready(function() {
		$("input[name='issues0']").change(function() {
			var returnItem = $("input[name='issues0']:checked").val();
			if(returnItem == "No") {
				$("input[name='issues5']").attr("disabled", "yes");
				$("#issueslabel5").addClass("quiet");
			}
			else {
				$("input[name='issues5']").removeAttr("disabled");
				$("#issueslabel5").removeClass("quiet");
			}
		});
		$("#offer").ajaxForm({
			beforeSubmit:checkOffer,
			success:afterOffer,
			dataType: 'json'
		});
	});

	
	function checkOffer(formData, jqForm, options) {
		var errors = "";
		$("#errors").hide();

		if(!($("input[name='issues0']:checked").val())) {
			$("#row0").addClass('rowerror');
			errors+="error";
		}
		else {
			$("#row0").removeClass('rowerror');
		}
		for(var i=1; i<5; i++) {
			if(!$("#issues" + i).val() || isNaN($("#issues" + i).val())) {
				$("#row"+i).addClass('rowerror');
				errors += "issues" + i + " ";
			}
			else {
				$("#row"+i).removeClass('rowerror');
			}
		}
		if (errors != "") {
			$("#errors").show();
			return false;
		}
		showLoading();
	}

	function afterOffer(data) {
		setTimeout(function() {
			hideLoading();
			window.location = 'offer.php';
		}, 3000);
	}
	//]]>
{/literal}
</script>
{include file="footer.tpl"}