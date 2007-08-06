    {include file="header.tpl"}
		<br />
<!-- TABS -->
{print_tabs tabs=$tabs_ar}
<!-- TABS BODY -->
    <div id="tabscontent">
<!-- USERS -->
      <a name="tabusers"></a>
      <div id="tabscontent_users">
{if $doUsers}
  {if $WC->isAdmin()}
	   {if $smarty.const._WC_ADMIN_CAN_ADD_USER}
		   {generate_href_button label='Add New User'|translate attrib='onclick="return window.frames[\'useriframe\'].location.href=\'edit_user.php\'"'}
		 {/if}
      <ul>
      {foreach from=$userlist  key=k item=v}
			  <li><a href="edit_user.php?user={$v.cal_login_id}" target="useriframe" onclick="show('useriframe');">
         {$v.cal_fullname}</a>
         {if $v.cal_is_admin == 'Y'}
				  &nbsp;<abbr title="{$denotesStr}">*</abbr>
				 {/if}
         </li>
			{/foreach}
       </ul>
      *&nbsp;{$denotesStr}<br />
      <iframe id="useriframe" name="useriframe"></iframe>
  {else }
       <iframe src="edit_user.php" id="accountiframe"></iframe>
  {/if}
    </div>

  {if $doGroups}
    <a name="tabgroups"></a>
      <div id="tabscontent_groups">
	     {generate_href_button label='Add New Group'|translate attrib='onclick="return window.frames[\'grpiframe\'].location.href=\'edit_group.php\'"'}
			 {if $groups}
        <ul>
				{foreach from=$groups   key=k item=v}
          <li>
				    <a title="{$v}" href="edit_group.php?eid={$k}" target="grpiframe" onclick="javascript:show('grpiframe');">{$v}</a>
				  </li>
        {/foreach}
        </ul>		
			 {/if}
			 <iframe id="grpiframe" name="grpiframe"></iframe>
			</div>	   
  {/if}

  {if $doNUCS}
     <a name="tabnonusers"></a>
     <div id="tabscontent_nonusers">
		 {generate_href_button label='Add New NonUser Calendar'|translate  attrib='onclick="return window.frames[\'nonusersiframe\'].location.href=\'edit_nonusers.php?add=1\'"'}
			 {if $nucuserlist}
        <ul>
				{foreach from=$nucuserlist  key=k item=v}
          <li>
				    <a title="{$v.cal_fullname}" href="edit_nonusers.php?nid={$v.cal_login_id}" target="nonusersiframe" onclick="show('nonusersiframe');">{$v.cal_fullname}</a>
				  </li>
        {/foreach}
        </ul>		
			 {/if}
			  <iframe id="nonusersiframe" name="nonusersiframe"></iframe>
			</div> 
  {/if}
{/if}

{if $doRemotes}
    <a name="tabnonusers"></a>
    <div id="tabscontent_remotes">
		{generate_href_button label='Add New Remote Calendar'|translate  attrib='onclick="return window.frames[\'remotesiframe\'].location.href=\'edit_remotes.php?add=1\'"'}
			 {if $rmtuserlist}
        <ul>
				{foreach from=$rmtuserlist  key=k item=v}
          <li>
				    <a title="{$v.cal_fullname}" href="edit_remotes.php?nid={$v.cal_login_id}"  target="remotesiframe" onclick="show('remotesiframe');">{$v.cal_fullname}</a>
				  </li>
        {/foreach}
        </ul>		
			 {/if}		
			  <iframe id="remotesiframe" name="remotesiframe"></iframe>
		 </div>		
{/if}

    </div>
    {include file="footer.tpl"}