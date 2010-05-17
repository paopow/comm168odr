{include file="header.tpl"}

<div class="main_body">
	<div class="loud headline append-bottom">{ $offer_title}</div>
	<div class="span-24 last">
		{include file="chat_notice.tpl"}
		<div class="prepend-3 span-18 last">
		<form id="offer" name="ofer" method="post" action="offer.php">
			<input type="hidden" name="offer" value="{$offer}" />
			<table>
				<tr>
					<th>Issues:</th>
					<th>Your Offer</th>
					<th>Casey's Counteroffer</th>
				</tr>
				{section name=issuesIndex loop=$issues}
					{ if $smarty.section.issuesIndex.index%2 == 0}
						<tr class="even">
					{else}
						<tr>
					{/if}
					<td width="250">{ $issues[issuesIndex] }</td>
					
					<td width="300"><div class="float: right;">
					{if $smarty.section.issuesIndex.index == 0}
						<input type="radio" name="issues0" value="Yes" disabled="yes" {if $offers[0]=="Yes"}checked="yes"{/if} />Yes 
						<input type="radio" name="issues0" value="No" disabled="yes" {if $offers[0]=="No"}checked="yes"{/if} />No
					{else}
						$<input type="text" size="10" maxlength="10" disabled="yes" name="issues{$smarty.section.issuesIndex.index}" value="{$offers[issuesIndex]}" />
					{/if}
					</div>
					</td>
					
					<td width="300"><div class="float: right;"> 
					{if $smarty.section.issuesIndex.index == 0}
							<input type="radio" name="c_issue0" value="Yes" disabled="yes" {if $counteroffers[0]=="Yes"}checked{/if}>Yes 
							<input type="radio" name="c_issue0" value="No" disabled="yes" {if $counteroffers[0]=="No"}checked{/if}>No
					{else}
						$<input type="text" size="10" maxlength="10" disabled="yes" name="c_issues{$smarty.section.issuesIndex.index}" value="{$counteroffers[issuesIndex]}" />
					{/if}
					</div>
					</td>
					</tr>
				{/section}
					<tr><td colspan="3"><div style="float: right;"><input type="submit" class="super large awesome black button" name="submit" value="Make Counteroffer" /><input type="submit" class="super large awesome red button" name="submit" value="Accept Offer" /></div></td></tr>
			</table>
		</form>
		</div>

	</div>
	{include file="chat.tpl"}
</div><!-- end main body -->

<script type="text/javascript">
{literal}
	//<![CDATA[
	 $(document).ready(function() {
	
	});
	//]]>
{/literal}
</script>
{include file="footer.tpl"}