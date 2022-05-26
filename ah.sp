#pragma semicolon 1

#define PLUGIN_AUTHOR "F0rest"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <multicolors>
#include <cstrike>
//#include <sdkhooks>

#pragma newdecls required

EngineVersion g_Game;

public Plugin myinfo = 
{
	name = "KOD Admin Helper",
	author = PLUGIN_AUTHOR,
	version = PLUGIN_VERSION
};

public void OnPluginStart()
{
	g_Game = GetEngineVersion();
	if(g_Game != Engine_CSGO && g_Game != Engine_CSS)
	{
		SetFailState("This plugin is for CSGO/CSS only.");	
	}
	RegAdminCmd("sm_ah", OnCallHelp, ADMFLAG_VOTE);
	CSetPrefix("[{green}KOD技术组{default}]");
}

public Action OnCallHelp(int client,int args)
{
	if(CheckCommandAccess(client, "sm_csay", 8, false))
	{
		if(CheckCommandAccess(client, "sm_slay", 8, false))
		{
			if(CheckCommandAccess(client, "sm_rr", 8, false))
			{
				CPrintToChat(client, "{lightgreen}服主/技术 {darkred}%N{default} 您好！指令帮助已经发送到控制台",client);
				PrintToConsole(client, "【停止投票】         sm_cancelvote\n【友伤开关】         sm_voteff\n【修改重力】         sm_votegravity [值数/严禁随意修改以免破坏平衡]\n【全局语音】         sm_votealltalk （严禁随意修改/如躲猫猫、狙服等互动性服）\n【踢出玩家】         sm_votekick [#ID] [原因/必须写明原因]  *（已开放给VIP使用）\n【临时封禁】         sm_voteban [#ID] [原因/必须写明原因] \n----正式OP----\n【管理聊天】         sm_chat [内容]  （管理员内部聊天出现在聊天区）\n【公告通知】         sm_csay [内容]\n【私聊玩家】         sm_psay [#ID或昵称] [内容]\n【踢出玩家】         sm_kick [#ID或昵称] [原因/必须写明原因] \n【禁止聊天】         sm_gag [#ID或昵称] [时间/分（0为永久）] [原因/必须写明原因] \n【禁止发言】         sm_mute [#ID或昵称] [时间/分（0为永久）] [原因/必须写明原因]");
				PrintToConsole(client, "【双禁玩家】         sm_silence [#ID或昵称] [时间/分（0为永久）] [原因/必须写明原因]\n【解除禁令】         sm_unsilence  sm_ungag  sm_unmute [#ID或昵称] [原因]  (在封禁指令前面加上un解除)\n----高级OP----\n【处死玩家】         sm_slay [#ID或昵称]  \n【高亮玩家】         sm_beacon [#ID或昵称]       \n【拍打玩家】         sm_slap [#ID或昵称] [血量]\n【点燃玩家】         sm_burn [#ID或昵称] [时间/秒]\n【封禁玩家】         sm_ban [#ID或昵称] [时间/分（0为永久）] [原因/必须写明原因]\n----服主----\nsm_extend	    扩展地图\nsm_clearmap		从地图中删除掉落的武器、物品和没有主人的鸡\nsm_restartgame 		在指定的秒数后重新启动游戏\nsm_rg			在指定秒后重新启动游戏\nsm_restartround		在指定秒后重新启动回合\nsm_rr		在指定秒后重新启动回合\nsm_equipments		在控制台中显示有效的设备名称 ");
				PrintToConsole(client, "sm_playsound		使用自定义设置为目标播放声音\nsm_teleport		传送目标到某物\nsm_tp		传送目标到某物\nsm_saveloc		为传送保存当前位置\nsm_savevec		为传送保存当前位置\nsm_team		设定目标团队\nsm_swap			交换目标团队\nsm_spec   		将目标团队设置为观众\nsm_scramble		按分数搅乱队伍\nsm_give			给目标一些东西\nsm_equip			为目标装备某物\nsm_disarm		解除目标武装\nsm_respawn 		重生目标\nsm_bury		    掩埋目标\nsm_speed			改速度\nsm_god             		无敌\nsm_helmet		为目标设置头盔\nsm_hp 	血量\nsm_health		为目标设置健康值\nsm_armor		为目标设定装甲\nsm_cash		为目标设定现金\nsm_setstats		为目标设置统计数据 ");
				PrintToConsole(client, "sm_teamscores	    设置团队分数\nsm_spawnchicken		在目标位置上繁殖一只鸡\nsm_sc		在目标位置上繁殖一只鸡\nsm_spawnball		在目标位置上生成一个球\n");
			}
			else{
				//高级OP
				CPrintToChat(client, "{red}高级OP {darkred}%N{default} 您好！指令帮助已经发送到控制台",client);
				PrintToConsole(client, "【停止投票】         sm_cancelvote\n【友伤开关】         sm_voteff\n【修改重力】         sm_votegravity [值数/严禁随意修改以免破坏平衡]\n【全局语音】         sm_votealltalk （严禁随意修改/如躲猫猫、狙服等互动性服）\n【踢出玩家】    sm_votekick [#ID] [原因/必须写明原因]  *（已开放给VIP使用）\n【临时封禁】    sm_voteban [#ID] [原因/必须写明原因] \n----正式OP----\n【管理聊天】         sm_chat [内容]  （管理员内部聊天出现在聊天区）\n【公告通知】         sm_csay [内容]\n【私聊玩家】         sm_psay [#ID或昵称] [内容]\n【踢出玩家】         sm_kick [#ID或昵称] [原因/必须写明原因] \n【禁止聊天】         sm_gag [#ID或昵称] [时间/分（0为永久）] [原因/必须写明原因] \n【禁止发言】         sm_mute [#ID或昵称] [时间/分（0为永久）] [原因/必须写明原因]\n【双禁玩家】         sm_silence [#ID或昵称] [时间/分（0为永久）] [原因/必须写明原因]");
				PrintToConsole(client, "【解除禁令】         sm_unsilence  sm_ungag  sm_unmute [#ID或昵称] [原因]  (在封禁指令前面加上un解除)\n----高级OP----\n【处死玩家】         sm_slay [#ID或昵称]  \n【高亮玩家】         sm_beacon [#ID或昵称]       \n【拍打玩家】         sm_slap [#ID或昵称] [血量]\n【点燃玩家】         sm_burn [#ID或昵称] [时间/秒]\n【封禁玩家】         sm_ban [#ID或昵称] [时间/分（0为永久）] [原因/必须写明原因]\n");
			}
		}
		else{
			//正式OP
			CPrintToChat(client, "{blue}正式OP {darkred}%N{default} 您好！指令帮助已经发送到控制台",client);
			PrintToConsole(client,"【停止投票】         sm_cancelvote\n【友伤开关】         sm_voteff\n【修改重力】         sm_votegravity [值数/严禁随意修改以免破坏平衡]\n【全局语音】         sm_votealltalk （严禁随意修改/如躲猫猫、狙服等互动性服）\n【临时封禁】         sm_voteban [#ID] [原因/必须写明原因]\n----正式OP----\n【管理聊天】         sm_chat [内容]  （管理员内部聊天出现在聊天区）\n【公告通知】         sm_csay [内容]\n【私聊玩家】         sm_psay [#ID或昵称] [内容]\n【踢出玩家】         sm_kick [#ID或昵称] [原因/必须写明原因] \n【禁止聊天】         sm_gag [#ID或昵称] [时间/分（0为永久）] [原因/必须写明原因] \n【禁止发言】         sm_mute [#ID或昵称] [时间/分（0为永久）] [原因/必须写明原因]\n【双禁玩家】         sm_silence [#ID或昵称] [时间/分（0为永久）] [原因/必须写明原因]");
			PrintToConsole(client, "【解除禁令】         sm_unsilence  sm_ungag  sm_unmute [#ID或昵称] [原因]  (在封禁指令前面加上un解除)\n");
		}
	}
	else{
		//实习op
		CPrintToChat(client, "{green}正式OP {darkred}%N{default} 您好！指令帮助已经发送到控制台",client);
		PrintToConsole(client,"【停止投票】         sm_cancelvote\n【友伤开关】         sm_voteff\n【修改重力】         sm_votegravity [值数/严禁随意修改以免破坏平衡]\n【全局语音】         sm_votealltalk （严禁随意修改/如躲猫猫、狙服等互动性服）\n【踢出玩家】         sm_votekick [#ID] [原因/必须写明原因]  *（已开放给VIP使用）\n【临时封禁】         sm_voteban [#ID] [原因/必须写明原因] \n");
	}
}