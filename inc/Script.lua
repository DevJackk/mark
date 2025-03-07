--[[

]]

function download_to_file(url, file_name)
  -- print to server
  -- print("url to download: "..url)
  -- uncomment if needed
  local respbody = {}
  local options = {
    url = url,
    sink = ltn12.sink.table(respbody),
    redirect = true
  }

  -- nil, code, headers, status
  local response = nil

  if url:starts('https') then
    options.redirect = false
    response = {https.request(options)}
  else
    response = {http.request(options)}
  end

  local code = response[2]
  local headers = response[3]
  local status = response[4]

  if code ~= 200 then return nil end

  file_name = file_name or get_http_file_name(url, headers)

  local file_path = "data/"..file_name
  -- print("Saved to: "..file_path)
	-- uncomment if needed
  file = io.open(file_path, "w+")
  file:write(table.concat(respbody))
  file:close()

  return file_path
end
function run_command(str)
  local cmd = io.popen(str)
  local result = cmd:read('*all')
  cmd:close()
  return result
end
function string:isempty()
  return self == nil or self == ''
end

-- Returns true if the string is blank
function string:isblank()
  self = self:trim()
  return self:isempty()
end

-- DEPRECATED!!!!!
function string.starts(String, Start)
  -- print("string.starts(String, Start) is DEPRECATED use string:starts(text) instead")
  -- uncomment if needed
  return Start == string.sub(String,1,string.len(Start))
end

-- Returns true if String starts with Start
function string:starts(text)
  return text == string.sub(self,1,string.len(text))
end

local getUser = function(user_id,cb)
tdcli_function({ID = "GetUser",user_id_ = user_id},cb,nil)
end

Bot_Api = 'https://api.telegram.org/bot'.. Token
function send_inline(chat_id,text,keyboard,markdown)
local url = Bot_Api
if keyboard then
url = url .. '/sendMessage?chat_id=' ..chat_id.. '&text='..URL.escape(text)..'&parse_mode=html&reply_markup='..URL.escape(json:encode(keyboard))
else
url = url .. '/sendMessage?chat_id=' ..chat_id.. '&text='..URL.escape(text)..'&parse_mode=HTML'
end
if markdown == 'md' or markdown == 'markdown' then
url = url..'&parse_mode=Markdown'
elseif markdown == 'html' then
url = url..'&parse_mode=HTML'
end
return https.request(url)
end








function lock_photos(msg)
if not msg.Director then 
return "𖤐 *│* هذا الامر يخص {المدير,المنشئ,المطور} فقط  \n"
end
redis:set(mark.."getidstatus"..msg.chat_id_, "Simple")
return  "𖤐 ** أهلا عزيزي "..msg.TheRankCmd.."\n𖤐 ** تم تعطيل الايدي بالصوره  \n" 
end 
function unlock_photos(msg)
if not msg.Director then
return "𖤐 ** هذا الامر يخص {المدير,المنشئ,المطور} فقط  \n"
end
redis:set(mark.."getidstatus"..msg.chat_id_, "Photo")
return  "𖤐 ** أهلا عزيزي "..msg.TheRankCmd.."\n𖤐 ** تم تفعيل الايدي بالصوره \n" 
end
function cmds_on(msg)
if not msg.Creator then return "𖤐 ** هذا الامر يخص {المنشئ,المطور} فقط  \n"
end
redis:set(mark..'lock:kara:'..msg.chat_id_,'on')
return "𖤐 ** أهلا عزيزي "..msg.TheRankCmd.."\n𖤐 ** تم تعطيل الرفع في المجموعه \n"
end
function cmds_off(msg)
if not msg.Creator then return "𖤐 ** هذا الامر يخص {المنشئ,المطور} فقط  \n"
end
redis:set(mark..'lock:kara:'..msg.chat_id_,'off')
return "𖤐 ** أهلا عزيزي "..msg.TheRankCmd.."\n𖤐 ** تم تفعيل الرفع في المجموعه \n"
end

function lockjoin(msg)
if not msg.Admin then return "𖤐 *│* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n"
end
redis:set(mark..'lock:join:'..msg.chat_id_,true)
return "*𖤐 ** أهلا عزيزي *"..msg.TheRankCmd.."*\n𖤐 ** تم قفل الدخول بالرابط \n*" 

end
function unlockjoin(msg)
if not msg.Admin then return "𖤐 ** هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n"
end
redis:del(mark..'lock:join:'..msg.chat_id_)
return "*𖤐 ** أهلا عزيزي *"..msg.TheRankCmd.."*\n𖤐 ** تم فتح الدخول بالرابط \n*" 
end


local function imark(msg,MsgText)

Channel = redis:get(mark..'setch') or katrenno
--JoinChannel
function is_JoinChannel(msg)
if redis:get(mark..'joinchnl') then
local url  = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..msg.sender_user_id_)
if res ~= 200 then
end
Joinchanel = json:decode(url)
if not GeneralBanned((msg.adduser or msg.sender_user_id_)) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not msg.SudoUser then
function name(arg,data)
bd = '𖤐 اسمك  ('..(data.first_name_ or '')..')\n𖤐 معرفك (@'..(data.username_ or '')..')\n\n𖤐 اشترك بالقناه اولا \n𖤐 ثم ارجع استخدم الامر.'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'اشترك بالقناه .',url='https://telegram.me/'..Channel}}}   
send_inline(msg.chat_id_,bd,keyboard,'html')
end
getUser(msg.sender_user_id_,name)
else
return true
end
else
return true
end
end
if msg.type ~= 'pv' then

if MsgText[1] == "تفعيل" and not MsgText[2] then
redis:set(mark.."getidstatus"..msg.chat_id_, "Photo")
redis:set(mark..'lock:kara:'..msg.chat_id_,'off')
return modadd(msg)  
end

if MsgText[1] == "تعطيل" and not MsgText[2] then
return modrem(msg) 
end






if MsgText[1] == "تفعيل الايدي بالصوره" and not MsgText[2] then
return unlock_photos(msg)  
end
if MsgText[1] == "تعطيل الايدي بالصوره" and not MsgText[2] then
return lock_photos(msg) 
end
if MsgText[1] == "تعطيل الرفع" and not MsgText[2] then
return cmds_on(msg)  
end
if MsgText[1] == "تفعيل الرفع" and not MsgText[2] then
return cmds_off(msg) 
end

if MsgText[1] == "قفل الدخول بالرابط" and not MsgText[2] then
return lockjoin(msg)  
end
if MsgText[1] == "فتح الدخول بالرابط" and not MsgText[2] then
return unlockjoin(msg) 
end

end


if msg.type ~= 'pv' and msg.GroupActive then 

if MsgText[1] == 'شحن' and MsgText[2] then
if not msg.SudoUser then return "♦️*│*هذا الامر يخص {المطور} فقط  \n💥" end
if tonumber(MsgText[2]) > 0 and tonumber(MsgText[2]) < 1001 then
local extime = (tonumber(MsgText[2]) * 86400)
redis:setex(mark..'ExpireDate:'..msg.chat_id_, extime, true)
if not redis:get(mark..'CheckExpire::'..msg.chat_id_) then 
redis:set(mark..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿\n🕵🏼️‍♀️│في مجموعه  » »  '..redis:get(mark..'group:name'..msg.chat_id_))
else
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│عزيزي المطور ✋🏿\n👨🏻‍🔧│شحن الاشتراك يكون ما بين يوم الى 1000 يوم فقط 🍃')
end 
return false
end

if MsgText[1] == 'الاشتراك' and MsgText[2] then 
if not msg.SudoUser then return "♦️*│*هذا الامر يخص {المطور} فقط  \n💥" end
if MsgText[2] == '1' then
redis:setex(mark..'ExpireDate:'..msg.chat_id_, 2592000, true)
if not redis:get(mark..'CheckExpire::'..msg.chat_id_) then 
redis:set(mark..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `30 يوم`  *(شهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم تفعيل الاشتراك  👍🏿\n📆│ الاشتراك » `30 يوم`  *(شهر)*')
end
if MsgText[2] == '2' then
redis:setex(mark..'ExpireDate:'..msg.chat_id_,7776000,true)
if not redis:get(mark..'CheckExpire::'..msg.chat_id_) then 
redis:set(mark..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `90 يوم`  *(3 اشهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `90 يوم`  *(3 اشهر)*')
end
if MsgText[2] == '3' then
redis:set(mark..'ExpireDate:'..msg.chat_id_,true)
if not redis:get(mark..'CheckExpire::'..msg.chat_id_) then 
redis:set(mark..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `مفتوح`  *(مدى الحياة)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `مفتوح`  *(مدى الحياة)*')
end 
return false
end


if MsgText[1] == 'الاشتراك' and not MsgText[2] and msg.Admin then
if not msg.Admin then return "♦️*│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
local check_time = redis:ttl(mark..'ExpireDate:'..msg.chat_id_)
if check_time < 0 then return '*مـفـتـوح *🎖\n✓' end
year = math.floor(check_time / 31536000)
byear = check_time % 31536000 
month = math.floor(byear / 2592000)
bmonth = byear % 2592000 
day = math.floor(bmonth / 86400)
bday = bmonth % 86400 
hours = math.floor( bday / 3600)
bhours = bday % 3600 
min = math.floor(bhours / 60)
sec = math.floor(bhours % 60)
if tonumber(check_time) > 1 and check_time < 60 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..sec..'* ثانيه'
elseif tonumber(check_time) > 60 and check_time < 3600 then
remained_expire = '💳│`باقي من الاشتراك ` » » '..min..' *دقيقه و * *'..sec..'* ثانيه'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 31536000 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..year..'* سنه و *'..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه' end
return remained_expire
end


if MsgText[1] == "المجموعه" then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
GetFullChat(msg.chat_id_,function(arg,data)
local GroupName = (redis:get(mark..'group:name'..msg.chat_id_) or '')
redis:set(mark..'linkGroup'..msg.chat_id_,(data.invite_link_ or ""))
return sendMsg(msg.chat_id_,msg.id_,
"𖤐 ❪ مـعـلومـات الـمـجـموعـه ❫\n\n"
.."*𖤐 * عدد الأعضاء ⇜ ❪ *"..data.member_count_.."* ❫"
.."\n*𖤐 * عدد المحظورين ⇜ ❪ *"..data.kicked_count_.."* ❫"
.."\n*𖤐 * عدد المشرفين ⇜ ❪ *"..data.administrator_count_.."* ❫"
.."\n*𖤐 * ايدي المجموعه ⇜ ❪"..msg.chat_id_.."❫"
.."\n\n𖤐 اسم المجموعه ⇜ ❪  ["..FlterName(GroupName).."]("..(data.invite_link_ or "")..")  ❫\n"
)
end,nil) 
return false
end

if MsgText[1] == "التفاعل" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="active"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="active"})
end  
return false
end

if MsgText[1] == "منع" then 
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return AddFilter(msg, MsgText[2]) 
end

if MsgText[1] == "الغاء منع" then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return RemFilter(msg, MsgText[2]) 
end

if MsgText[1] == "قائمه المنع" then 
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return FilterXList(msg) 
end

if MsgText[1] == "الحمايه" then 
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return settingsall(msg) 
end

if MsgText[1] == "الاعدادات" then 
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return settings(msg) 
end

if MsgText[1] == "الوسائط" then 
if not msg.Admin then return "𖤐 *│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return media(msg) 
end

if MsgText[1] == "الادمنيه" then 
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return GetListAdmin(msg) 
end

if MsgText[1] == "تاك" then
if not msg.Admin then return "𖤐 ** هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 100
},function(ta,taha)
local t = "\n قائمة الاعضاء \n——————\n"
x = 0
local list = taha.members_
for k, v in pairs(list) do
users = redis:get(mark..'user_names:'..v.user_id_) or v.user_id_
x = x + 1
t = t..""..x.." - {["..users.."](tg://user?id="..v.user_id_..")} \n"
end
send_msg(msg.chat_id_,t,msg.id_)
end,nil)
end

if (MsgText[1] == "نذار" and is_JoinChannel(msg)) then 
if not msg.Admin then return "𖤐 ** هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "تاك للكل" then 
if not msg.Admin then return "𖤐 ** هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "المنشى الاساسي" then 
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return MONSEBOT(msg) 
end

if MsgText[1] == "المدراء" then 
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return ownerlist(msg) 
end

if MsgText[1] == "المنشئ الاساسي" then 
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return Hussainlist(msg) 
end

if MsgText[1] == "المميزين" then 
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return whitelist(msg) 
end


if MsgText[1] == "صلاحياته" then 
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
Get_Info(msg,msg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
if MsgText[1] == "صلاحياتي" then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Get_Info(msg,msg.chat_id_,msg.sender_user_id_)
end  
end
if MsgText[1] == "صلاحياته" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if tonumber(msg.reply_to_message_id_) == 0 then 
local username = MsgText[2]
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 المعرف غير صحيح \n')   
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 هاذا معرف قناة \n')   
end      
Get_Info(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
end
if MsgText[1] == "فحص البوت" then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. msg.chat_id_ ..'&user_id='.. mark..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end 
return sendMsg(msg.chat_id_,msg.id_,'\n𖤐 ًاهلا عزيزي البوت هنا ادمن بالقروب \n𖤐 وصلاحياته هي ↓ \nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n𖤐 تغير معلومات المجموعه ↞ ❪ '..info..' ❫\n𖤐 حذف الرسائل ↞ ❪ '..delete..' ❫\n𖤐 حظر المستخدمين ↞ ❪ '..restrict..' ❫\n𖤐 دعوة مستخدمين ↞ ❪ '..invite..' ❫\n𖤐 تثبيت الرسائل ↞ ❪ '..pin..' ❫\n𖤐 اضافة مشرفين جدد ↞ ❪ '..promote..' ❫\n\n𖤐 ملاحضه » علامة ❪  ꪜ ❫ تعني لديه الصلاحية وعلامة ❪ ✘ ❫ تعني ليس ليديه الصلاحيه')   
end
end
end

if MsgText[1] == "تثبيت" and msg.reply_id then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
local GroupID = msg.chat_id_:gsub('-100','')
if not msg.Director and redis:get(mark..'lock_pin'..msg.chat_id_) then
return "لا يمكنك التثبيت الامر مقفول من قبل الاداره ."
else
tdcli_function({
ID="PinChannelMessage",
channel_id_ = GroupID,
message_id_ = msg.reply_id,
disable_notification_ = 1},
function(arg,data)
if data.ID == "Ok" then
redis:set(mark..":MsgIDPin:"..msg.chat_id_,msg.reply_id)
return sendMsg(msg.chat_id_,msg.id_,"𖤐 **ً أهلا عزيزي "..msg.TheRankCmd.." \n𖤐 ** تم تثبيت الرساله \n✓")
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** ًعذرا لا يمكنني التثبيت .\n𖤐 ** لست مشرف او لا املك صلاحيه التثبيت \n')    
end
end,nil)
end
return false
end

if MsgText[1] == "الغاء التثبيت" then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not msg.Director and redis:get(mark..'lock_pin'..msg.chat_id_) then
return "لا يمكنك الغاء التثبيت الامر مقفول من قبل الاداره"
else
local GroupID = msg.chat_id_:gsub('-100','')
tdcli_function({ID="UnpinChannelMessage",channel_id_ = GroupID},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"𖤐 **ًأهلا عزيزي "..msg.TheRankCmd.."  \n𖤐 ** تم الغاء تثبيت الرساله \n")    
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 **𖤐 عذراً لا يمكنني الغاء التثبيت .\n𖤐 ** لست مشرف او لا املك صلاحيه التثبيت \n')    
elseif data.ID == "Error" and data.code_ == 400 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** ًعذرا عزيزي '..msg.TheRankCmd..' .\n𖤐 ** لا توجد رساله مثبته لاقوم بازالتها \n')    
end
end,nil)
end
return false
end


if MsgText[1] == "تقييد" then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="tqeed"}) 
end 
return false
end

if MsgText[1] == "فك التقييد" or MsgText[1] == "فك تقييد" then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="fktqeed"}) 
end 
return false
end


if MsgText[1] == "رفع مميز" then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then
if redis:get(mark..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(mark..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(mark..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(mark..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"𖤐 ** أهلا عزيزي "..msg.TheRankCmd.."\n𖤐 ** الرفع معطل \n")
end
return false
end


if MsgText[1] == "تنزيل مميز" then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remwhitelist"})
end 
return false
end


if (MsgText[1] == "رفع المدير"  or MsgText[1] == "رفع مدير" ) then
if not msg.Creator then return "𖤐 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
if not MsgText[2] and msg.reply_id then
if redis:get(mark..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setowner"})
end
end
if redis:get(mark..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setowner"})
end
end
if redis:get(mark..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setowner"})
end
end
if redis:get(mark..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"𖤐 ** أهلاً عزيزي "..msg.TheRankCmd.."\n𖤐 ** الرفع معطل \n")
end
return false
end


if (MsgText[1] == "تنزيل المدير" or MsgText[1] == "تنزيل مدير" ) then
if not msg.Creator then return "𖤐 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remowner"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remowner"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remowner"})
end 
return false
end


if (MsgText[1] == "رفع منشى اساسي" or MsgText[1] == "رفع منشئ اساسي") then
if not msg.SudoUser then return "𖤐 **هذا الامر يخص {المطور,المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setkara"}) 
return false
end 
end

if (MsgText[1] == "تنزيل منشى اساسي" or MsgText[1] == "تنزيل منشئ اساسي") then
if not msg.SudoUser then return "𖤐 **هذا الامر يخص {المطور,المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remkara"}) 
return false
end 
end


if (MsgText[1] == "رفع منشى" or MsgText[1] == "رفع منشئ") then
if not msg.Kara then return "𖤐 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setmnsha"})
end  
return false
end


if (MsgText[1] == "تنزيل منشى" or MsgText[1] == "تنزيل منشئ" ) then
if not msg.Kara then return "𖤐 **هذا الامر يخص {المطور,المنشى الاساسي فقط} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remmnsha"})
end 
return false
end


if MsgText[1] == "رفع ادمن" then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not MsgText[2] and msg.reply_id then
if redis:get(mark..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="promote"})
end
end
if redis:get(mark..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="promote"})
end
end
if redis:get(mark..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="promote"})
end
end
if redis:get(mark..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"𖤐 ** أهلا عزيزي "..msg.TheRankCmd.."\n𖤐 ** الرفع معطل \n")
end
return false
end



if MsgText[1] == "تنزيل ادمن" then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="demote"})
end 
return false
end



if MsgText[1] == "تنزيل الكل" then
if not msg.Creator then return "𖤐 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end

local Admins = redis:scard(mark..'admins:'..msg.chat_id_)
redis:del(mark..'admins:'..msg.chat_id_)
local NumMDER = redis:scard(mark..'owners:'..msg.chat_id_)
redis:del(mark..'owners:'..msg.chat_id_)
local MMEZEN = redis:scard(mark..'whitelist:'..msg.chat_id_)
redis:del(mark..'whitelist:'..msg.chat_id_)

return "𖤐 أهلاً عزيزي "..msg.TheRankCmd.." ↓\n𖤐 تم تنزيل ❴ "..Admins.." ❵ من الادمنيه\n𖤐 تم تنزيل ❴ "..NumMDER.." ❵ من المدراء\n𖤐 تم تنزيل ❴ "..MMEZEN.." ❵ من المميزين\n\n𖤐 تم تـنـزيـل الـكـل بـنـجـاح\n" 
end


--{ Commands For locks }

if MsgText[1] == "قفل" then

if MsgText[2] == "الكل"		 then return lock_All(msg) end
if MsgText[2] == "الوسائط" 	 then return lock_Media(msg) end
if MsgText[2] == "الصور بالتقييد" 	 then return tqeed_photo(msg) end
if MsgText[2] == "الفيديو بالتقييد"  then return tqeed_video(msg) end
if MsgText[2] == "المتحركه بالتقييد" then return tqeed_gif(msg) end
if MsgText[2] == "التوجيه بالتقييد"  then return tqeed_fwd(msg) end
if MsgText[2] == "الروابط بالتقييد"  then return tqeed_link(msg) end
if MsgText[2] == "الدردشه"    	     then return mute_text(msg) end
if MsgText[2] == "المتحركه" 		 then return mute_gif(msg) end
if MsgText[2] == "الصور" 			 then return mute_photo(msg) end
if MsgText[2] == "الفيديو"			 then return mute_video(msg) end
if MsgText[2] == "البصمات" 		then  return mute_audio(msg) end
if MsgText[2] == "الصوت" 		then return mute_voice(msg) end
if MsgText[2] == "الملصقات" 	then return mute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return mute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return mute_forward(msg) end
if MsgText[2] == "الموقع"	 	then return mute_location(msg) end
if MsgText[2] == "الملفات" 		then return mute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return mute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return mute_inline(msg) end
if MsgText[2] == "الكيبورد" 	then return mute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return lock_link(msg) end
if MsgText[2] == "التاك" 		then return lock_tag(msg) end
if MsgText[2] == "المعرفات" 	then return lock_username(msg) end
if MsgText[2] == "التعديل" 		then return lock_edit(msg) end
if MsgText[2] == "الكلايش" 		then return lock_spam(msg) end
if MsgText[2] == "التكرار" 		then return lock_flood(msg) end
if MsgText[2] == "البوتات" 		then return lock_bots(msg) end
if MsgText[2] == "البوتات بالطرد" 	then return lock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return lock_markdown(msg) end
if MsgText[2] == "الويب" 		then return lock_webpage(msg) end 
if MsgText[2] == "التثبيت" 		then return lock_pin(msg) end 
end

--{ Commands For Unlocks }
if MsgText[1] == "فتح" 		then 
if MsgText[2] == "الكل" then return Unlock_All(msg) end
if MsgText[2] == "الوسائط" then return Unlock_Media(msg) end
if MsgText[2] == "الصور بالتقييد" 		then return fktqeed_photo(msg) 	end
if MsgText[2] == "الفيديو بالتقييد" 	then return fktqeed_video(msg) 	end
if MsgText[2] == "المتحركه بالتقييد" 	then return fktqeed_gif(msg) 	end
if MsgText[2] == "التوجيه بالتقييد" 	then return fktqeed_fwd(msg) 	end
if MsgText[2] == "الروابط بالتقييد" 	then return fktqeed_link(msg) 	end
if MsgText[2] == "المتحركه" 	then return unmute_gif(msg) 	end
if MsgText[2] == "الدردشه" 		then return unmute_text(msg) 	end
if MsgText[2] == "الصور" 		then return unmute_photo(msg) 	end
if MsgText[2] == "الفيديو" 		then return unmute_video(msg) 	end
if MsgText[2] == "البصمات" 		then return unmute_audio(msg) 	end
if MsgText[2] == "الصوت" 		then return unmute_voice(msg) 	end
if MsgText[2] == "الملصقات" 	then return unmute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return unmute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return unmute_forward(msg) end
if MsgText[2] == "الموقع" 		then return unmute_location(msg) end
if MsgText[2] == "الملفات" 		then return unmute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return unmute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return unmute_inline(msg) 	end
if MsgText[2] == "الكيبورد" 	then return unmute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return unlock_link(msg) 	end
if MsgText[2] == "التاك" 		then return unlock_tag(msg) 	end
if MsgText[2] == "المعرفات" 	then return unlock_username(msg) end
if MsgText[2] == "التعديل" 		then return unlock_edit(msg) 	end
if MsgText[2] == "الكلايش" 		then return unlock_spam(msg) 	end
if MsgText[2] == "التكرار" 		then return unlock_flood(msg) 	end
if MsgText[2] == "البوتات" 		then return unlock_bots(msg) 	end
if MsgText[2] == "البوتات بالطرد" 	then return unlock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return unlock_markdown(msg) end
if MsgText[2] == "الويب" 		then return unlock_webpage(msg) 	end
if MsgText[2] == "التثبيت" 		then return unlock_pin(msg) end 
end
 
if MsgText[1] == "انشاء رابط" then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(mark..'ExCmdLink'..msg.chat_id_) then
local LinkGp = ExportLink(msg.chat_id_)
if LinkGp then
LinkGp = LinkGp.result
redis:set(mark..'linkGroup'..msg.chat_id_,LinkGp)
redis:setex(mark..'ExCmdLink'..msg.chat_id_,120,true)
return sendMsg(msg.chat_id_,msg.id_,"𖤐 **تم انشاء رابط جديد \n𖤐 ["..LinkGp.."]\n𖤐 لعرض الرابط ارسل { الرابط } \n")
else
return sendMsg(msg.chat_id_,msg.id_,"𖤐 لا يمكنني انشاء رابط للمجموعه .\n𖤐 لانني لست مشرف في المجموعه \n")
end
else
return sendMsg(msg.chat_id_,msg.id_,"𖤐 لقد قمت بانشاء الرابط سابقا .\n𖤐 ارسل { الرابط } لرؤيه الرابط  \n")
end
return false
end 

if MsgText[1] == "ضع رابط" then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
redis:setex(mark..'linkGroup'..msg.sender_user_id_,300,true)
return '𖤐 عزيزي قم برسال الرابط الجديد ...🍂'
end

if MsgText[1] == "الرابط" then
if not redis:get(mark..'linkGroup'..msg.chat_id_) then 
return "𖤐 ** اوه لا يوجد رابط .\n𖤐 **لانشاء رابط ارسل { `انشاء رابط` }\n" 
end
local GroupName = redis:get(mark..'group:name'..msg.chat_id_)
local GroupLink = redis:get(mark..'linkGroup'..msg.chat_id_)
local LinkG = "["..GroupName.."]("..GroupLink..")"
return 
sendMsgg(msg.chat_id_,msg.id_,LinkG)
end
  

if MsgText[1] == "الرابط خاص" then
if not msg.Admin then return "𖤐 *│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
local GroupLink = redis:get(mark..'linkGroup'..msg.chat_id_)
if not GroupLink then return "𖤐 ** اوه لا يوجد هنا رابط\n𖤐 *رجائا اكتب [ضع رابط]*" end
local Text = "𖤐 رابـط الـمـجـمـوعه 𖤐 \n"..Flter_Markdown(redis:get(mark..'group:name'..msg.chat_id_)).." :\n\n["..GroupLink.."]\n"
local info, res = https.request(ApiToken..'/sendMessage?chat_id='..msg.sender_user_id_..'&text='..URL.escape(Text)..'&disable_web_page_preview=true&parse_mode=Markdown')
if res == 403 then
return "𖤐 **عذرا عزيزي \n𖤐 لم استطيع ارسالك الرابط لانك قمت بحظر البوت\n!"
elseif res == 400 then
return "𖤐 **عذرا عزيزي \n𖤐 لم استطيع ارسالك الرابط يجب عليك مراسله البوت اولا \n!"
end
if res == 200 then 
return "𖤐 **أهلاً عزيزي "..msg.TheRankCmd.."  \n𖤐 تم ارسال الرابط خاص لك ."
end
end


if MsgText[1] == "ضع القوانين" then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:setex(mark..'rulse:witting'..msg.sender_user_id_,300,true)
return '𖤐 حسننا عزيزي  .\n𖤐 الان ارسل القوانين  للمجموعه .'
end

if MsgText[1] == "القوانين" then
if not redis:get(mark..'rulse:msg'..msg.chat_id_) then 
return "𖤐 **مرحباً عزيري القوانين كلاتي .\n𖤐 ممنوع نشر الروابط \n𖤐 ممنوع التكلم او نشر صور اباحيه \n𖤐 ممنوع  اعاده توجيه\n𖤐 ممنوع التكلم بالسياسة \n𖤐 الرجاء احترام المدراء والادمنيه\n"
else 
return "*𖤐 القوانين :*\n"..redis:get(mark..'rulse:msg'..msg.chat_id_) 
end 
end


if MsgText[1] == "ضع تكرار" then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
local NumLoop = tonumber(MsgText[2])
if NumLoop < 1 or NumLoop > 50 then 
return "𖤐 ** حدود التكرار ,  يجب ان تكون ما بين  *[2-50]*" 
end
redis:set(mark..'flood'..msg.chat_id_,MsgText[2]) 
return "𖤐 ** تم وضع التكرار » { *"..MsgText[2].."* }"
end



if MsgText[1] == "مسح" then
if not MsgText[2] and msg.reply_id then 
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
Del_msg(msg.chat_id_, msg.reply_id) 
Del_msg(msg.chat_id_, msg.id_) 
return false
end

if MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if 500 < tonumber(MsgText[2]) then return "𖤐 ** حدود المسح ,  يجب ان تكون ما بين  *[2-100]*" end
local DelMsg = MsgText[2] + 1
GetHistory(msg.chat_id_,DelMsg,function(arg,data)
All_Msgs = {}
for k, v in pairs(data.messages_) do
if k ~= 0 then
if k == 1 then
All_Msgs[0] = v.id_
else
table.insert(All_Msgs,v.id_)
end  
end 
end 
if tonumber(DelMsg) == data.total_count_ then
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*𖤐 * تـم مسح ←  { *"..MsgText[2].."* } من الرسائل  \n")
end,nil))
else
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*𖤐 * تـم مسح ←  { *"..MsgText[2].."* } من الرسائل  \n")
end,nil))
end
end)
return false
end

if MsgText[2] == "الادمنيه" then 
if not msg.Director then return "𖤐 *هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end

local Admins = redis:scard(mark..'admins:'..msg.chat_id_)
if Admins ==0 then  
return "𖤐 ** اوه هنالك خطأ .\n𖤐 عذراً لا يوجد ادمنيه ليتم مسحهم ." 
end
redis:del(mark..'admins:'..msg.chat_id_)
return "𖤐 **أهلا عزيزي "..msg.TheRankCmd.."   \n𖤐 تم مسح {"..Admins.."} من الادمنيه في البوت \n"
end


if MsgText[2] == "قائمه المنع" then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local Mn3Word = redis:scard(mark..':Filter_Word:'..msg.chat_id_)
if Mn3Word == 0 then 
return "𖤐 ** عذراً لا توجد كلمات ممنوعه ليتم حذفها" 
end
redis:del(mark..':Filter_Word:'..msg.chat_id_)
return "𖤐 **أهلا عزيزي "..msg.TheRankCmd.."   \n𖤐 تم مسح {*"..Mn3Word.."*} كلمات من المنع"
end


if MsgText[2] == "القوانين" then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(mark..'rulse:msg'..msg.chat_id_) then 
return "𖤐 عذراً لا يوجد قوانين ليتم مسحه \n!" 
end
redis:del(mark..'rulse:msg'..msg.chat_id_)
return "𖤐 **أهلا عزيزي "..msg.TheRankCmd.."   \n𖤐 تم حذف القوانين بنجاح"
end


if MsgText[2] == "الترحيب"  then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(mark..'welcome:msg'..msg.chat_id_) then 
return "𖤐 ** اوه هنالك خطأ .\n𖤐 عذراً لا يوجد ترحيب ليتم مسحه ." 
end
redis:del(mark..'welcome:msg'..msg.chat_id_)
return "𖤐 **أهلا عزيزي "..msg.TheRankCmd.."   \n𖤐 تم حذف الترحيب بنجاح \n"
end


if MsgText[2] == "المنشئ الاساسي" then
if not msg.SudoUser then return "𖤐 **هذا الامر يخص {المطور} فقط  \n" end
local NumMnsha = redis:scard(mark..':Hussain:'..msg.chat_id_)
if NumMnsha ==0 then 
return "𖤐 عذراً لا يوجد منشى اساسي \n!" 
end
redis:del(mark..':Hussain:'..msg.chat_id_)
return "𖤐 **أهلا عزيزي "..msg.TheRankCmd.."   \n𖤐  تم مسح {* "..NumMnsha.." *} المنشى الاساسي \n✓"
end


if MsgText[2] == "المنشئيين" then
if not msg.SudoUser then return "𖤐 **هذا الامر يخص {المطور} فقط  \n" end
local NumMnsha = redis:scard(mark..':MONSHA_BOT:'..msg.chat_id_)
if NumMnsha ==0 then 
return "𖤐 عذراً لا يوجد منشئيين ليتم مسحهم \n!" 
end
redis:del(mark..':MONSHA_BOT:'..msg.chat_id_)
return "𖤐 **أهلا عزيزي "..msg.TheRankCmd.."   \n𖤐 تم مسح {* "..NumMnsha.." *} من المنشئيين\n"
end


if MsgText[2] == "المدراء" then
if not msg.Creator then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local NumMDER = redis:scard(mark..'owners:'..msg.chat_id_)
if NumMDER ==0 then 
return "𖤐 عذراً لا يوجد مدراء ليتم مسحهم \n!" 
end
redis:del(mark..'owners:'..msg.chat_id_)
return "𖤐 **أهلا عزيزي "..msg.TheRankCmd.."   \n𖤐 تم مسح {* "..NumMDER.." *} من المدراء  \n"
end

if MsgText[2] == 'المحظورين' then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end

local list = redis:smembers(mark..'banned:'..msg.chat_id_)
if #list == 0 then return "*𖤐 لا يوجد مستخدمين محظورين  *" end
message = '𖤐 ** قائمه الاعضاء المحظورين :\n'
for k,v in pairs(list) do
StatusLeft(msg.chat_id_,v)
end 
redis:del(mark..'banned:'..msg.chat_id_)
return "𖤐 **أهلا عزيزي "..msg.TheRankCmd.."   \n𖤐  تم مسح {* "..#list.." *} من المحظورين  \n"
end

if MsgText[2] == 'المكتومين' then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local MKTOMEN = redis:scard(mark..'is_silent_users:'..msg.chat_id_)
if MKTOMEN ==0 then 
return "𖤐 ** لا يوجد مستخدمين مكتومين في المجموعه " 
end
redis:del(mark..'is_silent_users:'..msg.chat_id_)
return "𖤐 **أهلا عزيزي "..msg.TheRankCmd.."   \n𖤐 تم مسح {* "..MKTOMEN.." *} من المكتومين  \n"
end

if MsgText[2] == 'المميزين' then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local MMEZEN = redis:scard(mark..'whitelist:'..msg.chat_id_)
if MMEZEN ==0 then 
return "*𖤐 *لا يوجد مستخدمين مميزين في المجموعه " 
end
redis:del(mark..'whitelist:'..msg.chat_id_)
return "𖤐 **أهلا عزيزي "..msg.TheRankCmd.."   \n𖤐 تم مسح {* "..MMEZEN.." *} من المميزين  \n"
end


if MsgText[2] == 'الرابط' then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(mark..'linkGroup'..msg.chat_id_) then
return "*𖤐 *لا يوجد رابط مضاف اصلا " 
end
redis:del(mark..'linkGroup'..msg.chat_id_)
return "𖤐 **أهلا عزيزي "..msg.TheRankCmd.."   \n𖤐 تم مسح رابط المجموعه \n"
end


end 
--End del 


if MsgText[1] == "ضع اسم" then
if not msg.Creator then return "𖤐 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
redis:setex(mark..'name:witting'..msg.sender_user_id_,300,true)
return "𖤐 حسننا عزيزي  .\n𖤐 الان ارسل الاسم  للمجموعه .\n"
end


if MsgText[1] == "مسح الصوره" then
if not msg.Creator then return "𖤐 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
https.request(ApiToken.."/deleteChatPhoto?chat_id="..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'𖤐 تم مسح الصوره المجموعه .\n')
end


if MsgText[1] == "ضع صوره" then
if not msg.Creator then return "𖤐 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then 
photo_id = data.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = data.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = GetInputFile(photo_id)},
function(arg,data)
if data.ID == "Ok" then
--return sendMsg(msg.chat_id_,msg.id_,'𖤐 تم تغيير صوره المجموعه ⠀\n')
elseif  data.code_ == 3 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ليس لدي صلاحيه تغيير الصوره \n𖤐 يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀\n')
end
end, nil)
end

end ,nil)
return false
else 
redis:setex(mark..'photo:group'..msg.chat_id_..msg.sender_user_id_,300,true)
return '𖤐 حسننا عزيزي .\n𖤐 الان قم بارسال الصوره\n' 
end 
end


if MsgText[1] == "ضع وصف" then 
if not msg.Creator then return "𖤐 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
redis:setex(mark..'about:witting'..msg.sender_user_id_,300,true) 
return "𖤐 حسننا عزيزي .\n𖤐 الان ارسل الوصف  للمجموعه\n" 
end


if MsgText[1] == "طرد البوتات" then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID="ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local Total = data.total_count_ or 0
if Total == 1 then
return sendMsg(msg.chat_id_,msg.id_,"𖤐 لا يـوجـد بـوتـات في الـمـجـمـوعـه .") 
else
local NumBot = 0
local NumBotAdmin = 0
for k, v in pairs(data.members_) do
if v.user_id_ ~= our_id then
kick_user(v.user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
NumBot = NumBot + 1
else
NumBotAdmin = NumBotAdmin + 1
end
local TotalBots = NumBot + NumBotAdmin  
if TotalBots  == Total - 1 then
local TextR  = "𖤐 عـدد الـبـوتات 𖤐⊱ {* "..(Total - 1).." *} ⊰𖤐\n\n"
if NumBot == 0 then 
TextR = TextR.."𖤐 لا يـمـكـن طردهم لانـهـم مشـرفـين .\n"
else
if NumBotAdmin >= 1 then
TextR = TextR.."𖤐 لم يتم طـرد {* "..NumBotAdmin.." *} بوت لأنهم مـشـرفين."
else
TextR = TextR.."𖤐 تم طـرد كــل البوتات بنجاح .\n"
end
end
return sendMsg(msg.chat_id_,msg.id_,TextR) 
end
end)
end
end
end

end,nil)

return false
end


if MsgText[1] == "كشف البوتات" then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID= "ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local total = data.total_count_ or 0
AllBots = '𖤐 قـائمه البوتات الـحالية\n\n'
local NumBot = 0
for k, v in pairs(data.members_) do
GetUserID(v.user_id_,function(arg,data)
if v.status_.ID == "ChatMemberStatusEditor" then
BotAdmin = "» *♚*"
else
BotAdmin = ""
end

NumBot = NumBot + 1
AllBots = AllBots..NumBot..'- @['..data.username_..'] '..BotAdmin..'\n'
if NumBot == total then
AllBots = AllBots..[[

𖤐 لديك {]]..total..[[} بوتات
𖤐 ملاحظة : الـ ♚ تعنـي ان البوت مشرف في المجموعـة.]]
sendMsg(msg.chat_id_,msg.id_,AllBots) 
end

end,nil)
end

end,nil)
return false
end


if MsgText[1] == 'طرد المحذوفين' then
if not msg.Creator then return "𖤐 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
sendMsg(msg.chat_id_,msg.id_,'𖤐 جارٍ البحث عن الحسابات المحذوفة ...')
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100','')
,offset_ = 0,limit_ = 200},function(arg,data)
if data.total_count_ and data.total_count_ <= 200 then
Total = data.total_count_ or 0
else
Total = 200
end
local NumMem = 0
local NumMemDone = 0
for k, v in pairs(data.members_) do 
GetUserID(v.user_id_,function(arg,datax)
if datax.type_.ID == "UserTypeDeleted" then 
NumMemDone = NumMemDone + 1
kick_user(v.user_id_,msg.chat_id_,function(arg,data)  
redis:srem(mark..':MONSHA_BOT:'..msg.chat_id_,v.user_id_)
redis:srem(mark..'whitelist:'..msg.chat_id_,v.user_id_)
redis:srem(mark..'owners:'..msg.chat_id_,v.user_id_)
redis:srem(mark..'admins:'..msg.chat_id_,v.user_id_)
end)
end
NumMem = NumMem + 1
if NumMem == Total then
if NumMemDone >= 1 then
sendMsg(msg.chat_id_,msg.id_,"𖤐 تم طـرد {* "..NumMemDone.." *} من الحسابات المحذوفه‏‏ .")
else
sendMsg(msg.chat_id_,msg.id_,'𖤐 لا يوجد حسابات محذوفه في المجموعه .')
end
end
end,nil)
end
end,nil)
return false
end  

if MsgText[1] == "ايدي" or MsgText[1]:lower() == "id" then
if not MsgText[2] and not msg.reply_id then

if redis:get(mark..'lock_id'..msg.chat_id_) then 
local msgs = redis:get(mark..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserNameID = "@"..data.username_.."" else UserNameID = "" end
local points = redis:get(mark..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if points and points ~= "0" then
nko = points
else
nko = '0'
end
local rfih = (redis:get(mark..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local NumGha = (redis:get(mark..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local Namei = FlterName(data.first_name_..' '..(data.last_name_ or ""),20)
GetPhotoUser(msg.sender_user_id_,function(arg, data)
if redis:get(mark.."getidstatus"..msg.chat_id_) == "Photo" then
	if data.photos_[0] then 
		ali = {'شهل صورة😍😌','لا قيمه للقمر امام وجهك🌚🥀','خليني احبك🙈❤️','ببكن خاص 🌚😹','نكبل 🙈♥','منور اليوم 😻','فديت الحلو🌚😹','شهل عسل ،₍🍯😻⁾ ','كلي يا حلو منين الله جابك🙈❤️','يهلا بلعافيه😍','مارتاحلك😐','تحبني؟🙈',
		}
		ssssys = ali[math.random(#ali)]
		if not redis:get("KLISH:ID") then
		sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,'• 𝐍𝐀𝐌𝐄  𖠰 '..Namei..'    \n• 𝐔𝐒𝐄𝐑𝐍𝐀𝐌𝐄 𖠰 '..UserNameID..' .\n• 𝐌𝐒𝐆𝐒 𖠰 '..msgs..' .\n• 𝐒𝐓𝐀𝐒𝐓 𖠰'..msg.TheRank..' .\n• 𝐘𝐎𝐔𝐑 𝐈𝐃 𖠰 '..msg.sender_user_id_..' .\n• 𝙲𝙷 𖠰 @MARK_5 .\n▁',dl_cb,nil)
		else
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,"🎇│"..ssssys.."\n"..Text.."",dl_cb,nil)
		end
	else
		if not redis:get("KLISH:ID") then
		sendMsg(msg.chat_id_,msg.id_,'𖤐لا يمكنني عرض صورتك لانك قمت بحظر البوت او انك لاتملك صوره في بروفيلك ...!\n• 𝐍𝐀𝐌𝐄  𖠰  '..Namei..'  \n• 𝐔𝐒𝐄𝐑𝐍𝐀𝐌𝐄 𖠰 '..UserNameID..' .\n• 𝐌𝐒𝐆𝐒 𖠰  '..msgs..' .\n• 𝐒𝐓𝐀𝐒𝐓 𖠰 '..msg.TheRank..' .\n• 𝐘𝐎𝐔𝐑 𝐈𝐃 𖠰 '..msg.sender_user_id_..' .\n•  𝙲𝙷 𖠰 @MARK_5 .\n▁')
		else
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Text))
		end
	end
else
	if redis:get("KLISH:ID") then
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Text))
		else
		sendMsg(msg.chat_id_,msg.id_,'𖤐الايدي بالصوره معطل \n• 𝐍𝐀𝐌𝐄  𖠰  '..Namei..'    \n• 𝐔𝐒𝐄𝐑𝐍𝐀𝐌𝐄 𖠰'..UserNameID..' .\n• 𝐌𝐒𝐆𝐒 𖠰 '..msgs..' .\n• 𝐒𝐓𝐀𝐒𝐓 𖠰 '..msg.TheRank..' .\n• 𝐘𝐎𝐔𝐑 𝐈𝐃 𖠰 '..msg.sender_user_id_..' .\n•  𝙲𝙷 𖠰 @MARK_5 .')
		end
end

end) 
end ,nil)
end
return false

end

if msg.reply_id and not MsgText[2] then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="iduser"})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="iduser"})
return false
end 
return false
end

if MsgText[1] == "الرتبه" and not MsgText[2] and msg.reply_id then 
return GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="rtba"})
end


if MsgText[1]== 'رسائلي' or MsgText[1] == 'رسايلي' or MsgText[1] == 'احصائياتي'  then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(mark..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(mark..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(mark..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(mark..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(mark..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(mark..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(mark..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(mark..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(mark..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info =  " \n𖤐 ( الاحـصـائـيـات الـرسـائـلك )\n \n"
.."𖤐 الـرسـائـل ( "..msgs.." )\n"
.."𖤐 الـجـهـات ( "..NumGha.." )\n"
.."𖤐 الـصـور ( "..photo.." )\n"
.."𖤐 الـمـتـحـركـه ( "..animation.." )\n"
.."𖤐 الـمـلـصـقات ( "..sticker.." )\n"
.."𖤐 الـبـصـمـات ( "..voice.." )\n"
.."𖤐 الـصـوت ( "..audio.." )\n"
.."𖤐 الـفـيـديـو ( "..video.." )\n"
.."𖤐 الـتـعـديـل ( "..edited.." )\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == 'مسح' and MsgText[2] == 'رسائلي'  then
local msgs = redis:get(mark..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
if rfih == 0 then  return "𖤐 **عذرا لا يوجد رسائل لك في البوت  ." end
redis:del(mark..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_)
return "𖤐 **تم مسح {* "..msgs.." *} من رسائلك .\n"
end

if MsgText[1]== 'جهاتي' then
return '𖤐 **  عدد جهاتك المضافة‏‏ ⇜ ❪ '..(redis:get(mark..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ❫ \n.'
end

if MsgText[1] == 'مسح' and MsgText[2] == 'جهاتي'  then
local adduser = redis:get(mark..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0
if adduser == 0 then  return "𖤐 **عذرا ليس لديك جهات لكي يتم مسحها" end
redis:del(mark..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) 
return "𖤐 **تم مسح {* "..adduser.." *} من جهاتك\n✓"
end

if MsgText[1]== 'اسمي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local FlterName = FlterName(data.first_name_..'\n\n-اسمك الثاني ⇜ '..(data.last_name_ or ""),90)
local Get_info = "-اسمك الاول ⇜ \n "..FlterName.." \n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == 'مسح' and MsgText[2] == 'نقاطي'  then
local points = redis:get(mark..':User_Points:'..msg.chat_id_..msg.sender_user_id_) or 0
if points == 0 then  return "𖤐 **عذرا ليس لديك نقاط لكِ يتم مسحها" end
redis:del(mark..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
return "𖤐 **تم مسح {* "..points.." *} من نقاطك\n"
end

if MsgText[1] == 'معلوماتي' or MsgText[1] == 'موقعي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(mark..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(mark..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(mark..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(mark..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(mark..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(mark..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(mark..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(mark..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(mark..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="𖤐 اهلاً بك في معلوماتك . \n"
.."————————————————\n"
.."𖤐 الأسم ( "..FlterName(data.first_name_..' '..(data.last_name_ or ""),25).." )\n"
.."𖤐 المعرف ( "..ResolveUser(data).." )\n"
.."𖤐 الأيدي ( `"..msg.sender_user_id_.."` )\n"
.."𖤐 رتبتك ( "..msg.TheRank.." )\n"
.."𖤐 ـ ( `"..msg.chat_id_.."` )\n"
.."————————————————\n"
.." 𖤐 الأحصائيات الرسائل .\n"
.."𖤐 الرسائل ( `"..msgs.."` )\n"
.."𖤐 الجهات ( `"..NumGha.."` )\n"
.."𖤐 الصور ( `"..photo.."` )\n"
.."𖤐 المتحركه ( `"..animation.."` )\n"
.."𖤐 الملصقات ( `"..sticker.."` )\n"
.."𖤐 البصمات ( `"..voice.."` )\n"
.."𖤐 الصوت ( `"..audio.."` )\n"
.."𖤐 الفيديو ( `"..video.."` )\n"
.."𖤐 التعديل (`"..edited.."` )\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "مسح معلوماتي" then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:del(mark..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:del(mark..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:del(mark..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:del(mark..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:del(mark..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:del(mark..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:del(mark..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:del(mark..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:del(mark..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="𖤐 أهلاً عزيزي تم مسح جميع معلوماتك "
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "تفعيل" then

if MsgText[2] == "الردود" 	then return unlock_replay(msg) end
if MsgText[2] == "الاذاعه" 	then return unlock_brod(msg) end
if MsgText[2] == "الايدي" 	then return unlock_ID(msg) end
if MsgText[2] == "االترحيب" 	then return unlock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return unlock_waring(msg) end 
end




if MsgText[1] == "تعطيل" then

if MsgText[2] == "الردود" 	then return lock_replay(msg) end
if MsgText[2] == "الاذاعه" 	then return lock_brod(msg) end
if MsgText[2] == "الايدي" 	then return lock_ID(msg) end
if MsgText[2] == "االترحيب" 	then return lock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return lock_waring(msg) end
end


if MsgText[1] == "ضع الترحيب" then 
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:set(mark..'welcom:witting'..msg.sender_user_id_,true) 
return "𖤐 حسننا عزيزي .\n𖤐 ارسل كليشه الترحيب الان\n\n𖤐 ملاحظه تستطيع اضافه دوال للترحيب مثلا :\n𖤐 أظهار قوانين المجموعه  » *{القوانين}*  \n𖤐  أظهار الاسم العضو » *{الاسم}*\n𖤐 أظهار المعرف العضو » *{المعرف}*\n𖤐 أظهار اسم المجموعه » *{المجموعه}*" 
end


if MsgText[1] == "الترحيب" then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if redis:get(mark..'welcome:msg'..msg.chat_id_)  then
return Flter_Markdown(redis:get(mark..'welcome:msg'..msg.chat_id_))
else 
return "𖤐 **أهلا عزيزي "..msg.TheRankCmd.."  \n𖤐 نورت المجموعه \n" 
end 
end


if MsgText[1] == "كشف"  then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="whois"})
return false
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="whois"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="whois"}) 
return false
end 
end


if MsgText[1] == "طرد" then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kick"})  
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="kick"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="kick"}) 
return false
end 
end


if MsgText[1] == "حظر" then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="ban"}) 
return false
end 
end


if (MsgText[1] == "الغاء الحظر" or MsgText[1] == "الغاء حظر") and msg.Admin then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="uban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unban"})
return false
end 
end


if MsgText[1] == "كتم" then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="silent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="silent"}) 
return false
end 
end


if MsgText[1] == "الغاء الكتم" or MsgText[1] == "الغاء كتم" then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unsilent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unsilent"}) 
return false
end 
end

if MsgText[1] == "المكتومين" then 
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return MuteUser_list(msg) 
end

if MsgText[1] == "المحظورين" then 
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return GetListBanned(msg) 
end

if MsgText[1] == "رفع الادمنيه" then
if not msg.Creator then return "𖤐 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
return set_admins(msg) 
end

end -- end of insert group 


if MsgText[1] == 'مسح' and MsgText[2] == 'المطورين'  then
if not msg.SudoBase then return"𖤐 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
local mtwren = redis:scard(mark..':SUDO_BOT:')
if mtwren == 0 then  return "𖤐 ** عذراً لا يوجد مطورين في البوت ." end
redis:del(mark..':SUDO_BOT:') 
return "𖤐 ** تم مسح {* "..mtwren.." *} من المطورين .\n"
end

if MsgText[1] == 'مسح' and MsgText[2] == "قائمه العام"  then
if not msg.SudoBase then return"𖤐 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
local addbannds = redis:scard(mark..'gban_users')
if addbannds ==0 then 
return "*𖤐 قائمة الحظر فارغه .*" 
end
redis:del(mark..'gban_users') 
return "𖤐 ** تـم مـسـح { *"..addbannds.." *} من قائمه العام\n" 
end 

if msg.SudoBase then

if MsgText[1] == "رفع مطور" then
if not msg.SudoBase then return "𖤐 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="up_sudo"}) 
return false
end 
end

if MsgText[1] == "تنزيل هكر" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="dn_sudo"}) 
return false
end 
end

if MsgText[1] == "تنظيف المجموعات" or MsgText[1] == "تنظيف المجموعات 🗑" then
local groups = redis:smembers(mark..'group:ids')
local GroupsIsFound = 0
for i = 1, #groups do 
GroupTitle(groups[i],function(arg,data)
if data.code_ and data.code_ == 400 then
rem_data_group(groups[i])
print(" Del Group From list ")
else
print(" Name Group : "..data.title_)
GroupsIsFound = GroupsIsFound + 1
end
print(GroupsIsFound..' : '..#groups..' : '..i)
if #groups == i then
local GroupDel = #groups - GroupsIsFound 
if GroupDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'𖤐 ** جـيـد , لا توجد مجموعات وهميه \n')
else
sendMsg(msg.chat_id_,msg.id_,'𖤐 ** عدد المجموعات 𖤐⊱ { *'..#groups..'*  } ⊰𖤐\n𖤐 ** تـم تنظيف  𖤐⊱ { *'..GroupDel..'*  } ⊰𖤐 مجموعه \n𖤐 ** اصبح العدد الحقيقي الان 𖤐⊱ { *'..GroupsIsFound..'*  } ⊰𖤐 مجموعه')
end
end
end)
end
return false
end
if MsgText[1] == "تنظيف المشتركين" or MsgText[1] == "تنظيف المشتركين 🗑" then
local pv = redis:smembers(mark..'users')
local NumPvDel = 0
for i = 1, #pv do
GroupTitle(pv[i],function(arg,data)
sendChatAction(pv[i],"Typing",function(arg,data)
if data.ID and data.ID == "Ok"  then
print("Sender Ok")
else
print("Failed Sender Nsot Ok")
redis:srem(mark..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
if NumPvDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'𖤐 جـيـد , لا يوجد مشتركين وهمي')
else
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'𖤐 ** عدد المشتركين 𖤐⊱ { *'..#pv..'*  } ⊰𖤐\n𖤐 ** تـم تنظيف  𖤐⊱ { *'..NumPvDel..'*  } ⊰𖤐 مشترك \n𖤐 ** اصبح العدد الحقيقي الان 𖤐⊱ { *'..SenderOk..'*  } ⊰𖤐 من المشتركين') 
end
end
end)
end)
end
return false
end
if MsgText[1] == "ضع صوره للترحيب" or MsgText[1]=="ضع صوره للترحيب 🌄" then
redis:setex(mark..'welcom_ph:witting'..msg.sender_user_id_,300,true) 
return'𖤐 حسننا عزيزي .\n𖤐 الان قم بارسال الصوره للترحيب \n' 
end

if MsgText[1] == "تعطيل" and MsgText[2] == "البوت خدمي" then
return lock_service(msg) 
end

if MsgText[1] == "تفعيل" and MsgText[2] == "البوت خدمي" then 
return unlock_service(msg) 
end

if MsgText[1] == "صوره الترحيب" then
local Photo_Weloame = redis:get(mark..':WELCOME_BOT')
if Photo_Weloame then
sendPhoto(msg.chat_id_,msg.id_,Photo_Weloame,[[𖤐 اهلا انا بوت]]..redis:get(mark..':NameBot:')..[[ .
𖤐 اختصاصي حماية‌‏ المجموعات
𖤐 مـن السبام والتوجيه‌‏ والتكرار والخ...

𖤐 مـعـرف الـمـطـور  » ]]..SUDO_USER:gsub([[\_]],'_')..[[ .
]])

return false
else
return "𖤐 لا توجد صوره مضافه للترحيب في البوت \n𖤐 لاضافه صوره الترحيب ارسل `ضع صوره للترحيب`"
end
end

if MsgText[1] == "ضع كليشه المطور" then 
redis:setex(mark..'text_sudo:witting'..msg.sender_user_id_,1200,true) 
return '𖤐 حسننا عزيزي .\n𖤐 الان قم بارسال الكليشه \n' 
end

if MsgText[1] == "ضع شرط التفعيل" and MsgText[2] and MsgText[2]:match('^%d+$') then 
redis:set(mark..':addnumberusers',MsgText[2]) 
return '𖤐 ** تم وضـع شـرط التفعيل البوت اذا كانت المجموعه‏‏ اكثر مـن *【'..MsgText[2]..'】* عضـو  .\n' 
end

if MsgText[1] == "شرط التفعيل" then 
return'𖤐 ** شـرط التفعيل البوت اذا كانت المجموعه‏‏ اكثر مـن *【'..redis:get(mark..':addnumberusers')..'】* عضـو .\n' 
end 
end

if MsgText[1] == 'المجموعات' or MsgText[1] == "المجموعات 🌋" then
if not msg.SudoUser then return "𖤐 **هذا الامر يخص {المطور} فقط  \n" end
return '𖤐 ** عدد المجموعات المفعلة » `'..redis:scard(mark..'group:ids')..'`  ➼' 
end

if MsgText[1] == "المشتركين" or MsgText[1] == "المشتركين Ⓜ" then
if not msg.SudoUser then return "𖤐 **هذا الامر يخص {المطور} فقط  \n" end
return '𖤐 **عدد المشتركين في البوت : `'..redis:scard(mark..'users')..'` \n'
end

if MsgText[1] == 'قائمه المجموعات' then 
if not msg.SudoBase then return "𖤐 **هذا الامر يخص {المطور} فقط  \n" end
return chat_list(msg) 
end

if MsgText[1] == 'تعطيل' and MsgText[2] and MsgText[2]:match("-100(%d+)") then
if not msg.SudoUser then return "𖤐 **هذا الامر يخص {المطور} فقط  \n" end
if redis:sismember(mark..'group:ids',MsgText[2]) then
local name_gp = redis:get(mark..'group:name'..MsgText[2])
sendMsg(MsgText[2],0,'𖤐 ** تم تعطيل المجموعه بأمر من المطور  \n𖤐 ** سوف اغادر ...\n✘')
rem_data_group(MsgText[2])
StatusLeft(MsgText[2],our_id)
return '𖤐 ** تم تعطيل المجموعه ومغادرتها \n𖤐 ** المجموعة » ['..name_gp..']\n𖤐 ** الايدي » ( *'..MsgText[2]..'* )\n'
else 
return '𖤐 ** لا توجد مجموعه مفعله بهذا الايدي .\n ' 
end 
end 

if MsgText[1] == 'المطور' then
return redis:get(mark..":TEXT_SUDO") or '𖤐 لا توجد كليشه المطور .\n𖤐 يمكنك اضافه كليشه من خلال الامر\n       " `ضع كليشه المطور` " \n'
end

if MsgText[1] == "اذاعه عام بالتوجيه" or MsgText[1] == "اذاعه عام بالتوجيه 📣" then
if not msg.SudoUser then return"𖤐 **هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(mark..'lock_brod') then 
return "𖤐 ** الاذاعه مقفوله من قبل المطور الاساسي  ." 
end
redis:setex(mark..'fwd:'..msg.sender_user_id_,300, true) 
return "𖤐 حسننا الان ارسل التوجيه للاذاعه \n" 
end

if MsgText[1] == "اذاعه عام" or MsgText[1] == "اذاعه عام 📢" then		
if not msg.SudoUser then return"𖤐 **هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(mark..'lock_brod') then 
return "𖤐 ** الاذاعه مقفوله من قبل المطور الاساسي  ." 
end
redis:setex(mark..'fwd:all'..msg.sender_user_id_,300, true) 
return "𖤐 حسننا الان ارسل الكليشه للاذاعه عام \n" 
end

if MsgText[1] == "اذاعه خاص" or MsgText[1] == "اذاعه خاص 🗣" then		
if not msg.SudoUser then return "𖤐 **هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(mark..'lock_brod') then 
return "𖤐 ** الاذاعه مقفوله من قبل المطور الاساسي  ." 
end
redis:setex(mark..'fwd:pv'..msg.sender_user_id_,300, true) 
return "𖤐 حسننا الان ارسل الكليشه للاذاعه خاص \n"
end

if MsgText[1] == "اذاعه" or MsgText[1] == "اذاعه 🗣" then		
if not msg.SudoUser then return"𖤐 **هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(mark..'lock_brod') then 
return "𖤐 ** الاذاعه مقفوله من قبل المطور الاساسي  ." 
end
redis:setex(mark..'fwd:groups'..msg.sender_user_id_,300, true) 
return "𖤐 حسننا الان ارسل الكليشه للاذاعه للمجموعات \n" 
end

if MsgText[1] == "المطورين" or MsgText[1] == "المطورين 🔥" then
if not msg.SudoUser then return"𖤐 **هذا الامر يخص {المطور} فقط  \n𖤐 " end
return sudolist(msg) 
end
 
if MsgText[1] == "قائمه العام" or MsgText[1]=="قائمه العام 📜" then 
if not msg.SudoUser then return"𖤐 **هذا الامر يخص {المطور} فقط  \n" end
return GetListGeneralBanned(msg) 
end

if MsgText[1] == "تعطيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل ✖️") then 
if not msg.SudoBase then return"𖤐 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
return lock_twasel(msg) 
end

if MsgText[1] == "تفعيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل 🔛") then 
if not msg.SudoBase then return"𖤐 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
return unlock_twasel(msg) 
end

if MsgText[1] == "حظر عام" then
if not msg.SudoBase then 
return "𖤐 **هذا الامر يخص {المطور الاساسي} فقط  \n" 
end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="banall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="bandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="banall"}) 
return false
end 
end

if MsgText[1] == "الغاء العام" or MsgText[1] == "الغاء عام" then
if not msg.SudoBase then return"𖤐 **هذا الامر يخص {المطور الاساسي} فقط  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unbanall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unbandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unbanall"}) 
return false
end 
end 

if MsgText[1] == "رتبتي" then return '𖤐 ** رتبتك هنا 𖣄 ←  ( '..msg.TheRank..' )\n' end

----------------- استقبال الرسائل ---------------
if MsgText[1] == "الغاء الامر ✖️" or MsgText[1] == "الغاء" then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:del(mark..'welcom:witting'..msg.sender_user_id_,
mark..'rulse:witting'..msg.sender_user_id_,
mark..'rulse:witting'..msg.sender_user_id_,
mark..'name:witting'..msg.sender_user_id_,
mark..'about:witting'..msg.sender_user_id_,
mark..'fwd:all'..msg.sender_user_id_,
mark..'fwd:pv'..msg.sender_user_id_,
mark..'fwd:groups'..msg.sender_user_id_,
mark..'namebot:witting'..msg.sender_user_id_,
mark..'addrd_all:'..msg.sender_user_id_,
mark..'delrd:'..msg.sender_user_id_,
mark..'addrd:'..msg.sender_user_id_,
mark..'delrdall:'..msg.sender_user_id_,
mark..'text_sudo:witting'..msg.sender_user_id_,
mark..'addrd:'..msg.chat_id_..msg.sender_user_id_,
mark..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return '𖤐 ** تم إلغاء الأمر بنجاح .  \n'
end  


if (MsgText[1] ==  'تحديث السورس'  or MsgText[1] ==  'تحديث السورس 🔂' ) then
if not msg.SudoBase then return "*│*هذا الامر يخص {المطور الاساسي} فقط  \n" end
local GetVerison = https.request( 'https://raw.githubusercontent.com/jack1eljoker1/blackfiles/main/GetVersion.txt' ) or 0
print(GetVerison.." > "..version)
if GetVerison > version then
UpdateSourceStart = true
sendMsg(msg.chat_id_,msg.id_,' *╿* يوجد تحديث جديد الان \n*╽* جاري تنزيل وتثبيت التحديث  ...' )
redis:set(mark..":VERSION",GetVerison)
return false
else
return "╿الاصدار الحالي : *v"..version.."* \n*╽* لديـك احدث اصدار \n"
end
return false
end

if MsgText[1] == 'اصدار السورس' or MsgText[1] == 'الاصدار' then
return '𖤐 اصدار سورس bebo : *v'..version..'* \n'
end



if MsgText[1] == 'نسخه احتياطيه للمجموعات' then
if not msg.SudoBase then return"𖤐 *│*هذا الامر يخص {المطور الاساسي} فقط  \n" end
return buck_up_groups(msg)
end 

if MsgText[1] == 'رفع نسخه الاحتياطيه' then
if not msg.SudoBase then return "𖤐 *│*هذا الامر يخص {المطور الاساسي} فقط  \n" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessageDocument' then
local file_name = data.content_.document_.file_name_
if file_name:match('.json')then
if file_name:match('@[%a%d_]+.json') then
if file_name:lower():match('@[%a%d_]+') == Bot_User:lower() then 
io.popen("rm -f ../.telegram-cli/data/document/*")
local file_id = data.content_.document_.document_.id_ 
tdcli_function({ID = "DownloadFile",file_id_ = file_id},function(arg, data) 
if data.ID == "Ok" then
Uploaded_Groups_Ok = true
Uploaded_Groups_CH = msg.chat_id_
Uploaded_Groups_MS = msg.id_
print(Uploaded_Groups_CH)
print(Uploaded_Groups_MS)
sendMsg(msg.chat_id_,msg.id_,'𖤐 ** جارٍ رفع النسخه انتظر قليلا ... \n')
end
end,nil)
else 
sendMsg(msg.chat_id_,msg.id_,"𖤐 ** عذراً النسخه الاحتياطيه هذا ليست للبوت » ["..Bot_User.."]  \n")
end
else 
sendMsg(msg.chat_id_,msg.id_,'𖤐 ** عذراً اسم الملف غير مدعوم للنظام او لا يتوافق مع سورس المطور يرجاء جلب الملف الاصلي الذي قمت بسحبه وبدون تعديل ع الاسم\n')
end  
else
sendMsg(msg.chat_id_,msg.id_,'𖤐 ** عذراً الملف ليس بصيغه Json !?\n')
end 
else
sendMsg(msg.chat_id_,msg.id_,'𖤐 ** عذراً هذا ليس ملف النسحه الاحتياطيه للمجموعات\n')
end 
end,nil)
else 
return "𖤐 ** ارسل ملف النسخه الاحتياطيه اولا\n𖤐 ** ثم قم بالرد على الملف وارسل \" `رفع نسخه الاحتياطيه` \" "
end 
return false
end

if (MsgText[1]=="تيست" or MsgText[1]=="test") then 
if not msg.SudoBase then return"𖤐 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
return "𖤐 البوت شـغــال ." 
end

if (MsgText[1]== "ايدي" or MsgText[1]=="ايديي🆔") and msg.type == "pv" then return  "\n𖤐 اهلاً عزيزي المطور ايديك :\n\n𖤐 "..msg.sender_user_id_.."\n"  end

if MsgText[1]== "قناة السورس" and msg.type == "pv" then
local inline = {{{text="-قنآهہ‏‏ آلسـورس اضـغـط هـنـآ ",url="https://t.me/MARK_5"}}}
send_key(msg.sender_user_id_,'   [قناة سورس : MARK_5](https://t.me/RISK_00)' ,nil,inline,msg.id_)
return false
end

if MsgText[1]== "رفع نسخه الاحتياطيه" and msg.type == "pv" then
local inline = {{{text="-رفع نسخه الاحتياطيه "}}}
send_key(msg.sender_user_id_,'   [رفع نسخه الاحتياطيه)' ,nil,inline,msg.id_)
return false
end

if MsgText[1]== "★  أّلَمًبًرمًجّ أّلَأّسِـأّسِـى ★" and msg.type == "pv" then
local inline = {{{text="★  أّلَمًبًرمًجّ أّلَأّسِـأّسِـى ★",url="https://t.me/eljo_ker_m"}}}
send_key(msg.sender_user_id_,'   [★  أّلَمًبًرمًجّ أّلَأّسِـأّسِـى ★](https://t.me/eljo_ker_m)' ,nil,inline,msg.id_)
return false
end

if MsgText[1]== "★  وٌأّتٌـسِـأّبً أّلَمًبًرمًجّ أّلَأّسِـأّسِـى ★" and msg.type == "pv" then
local inline = {{{text="★  وٌأّتٌـسِـأّبً أّلَمًبًرمًجّ أّلَأّسِـأّسِـى ★ا",url="https://wa.me/+201010543299?text="}}}
send_key(msg.sender_user_id_,'   [★  وٌأّتٌـسِـأّبً أّلَمًبًرمًجّ أّلَأّسِـأّسِـى ★](https://wa.me/+201013842386?text=)' ,nil,inline,msg.id_)
return false
end

if MsgText[1]== "بابلو المالك" and msg.type == "pv" then
local inline = {{{text="-مالك السورس اضـغـط هـنـآ ",url="https://t.me/pabl0oooo"}}}
send_key(msg.sender_user_id_,'   [مالك السورس](https://t.me/pabl0oooo)' ,nil,inline,msg.id_)
return false
end

if MsgText[1]== "مهدي المالك" and msg.type == "pv" then
local inline = {{{text="-مالك السورس اضـغـط هـنـآ ",url="https://t.me/QpSSpQ"}}}
send_key(msg.sender_user_id_,'   [مهدي المالك](https://t.me/QpSSpQ)' ,nil,inline,msg.id_)
return false
end

if (MsgText[1]== "الاحصائيات 💥" or MsgText[1]=="الاحصائيات") then
if not msg.SudoBase then return"𖤐 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
return '𖤐 الاحصائيات . \n\n𖤐 **عدد المجموعات المفعله : '..redis:scard(mark..'group:ids')..'\n𖤐 **عدد المشتركين في البوت : '..redis:scard(mark..'users')..'\n'
end
---------------[End Function data] -----------------------
if MsgText[1]=="اضف رد عام" or MsgText[1]=="اضف رد عام ➕" then
if not msg.SudoBase then return"𖤐 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(mark..'addrd_all:'..msg.chat_id_..msg.sender_user_id_,300,true)
redis:del(mark..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
return "𖤐 حسننا الان ارسل كلمة الرد العام .\n"
end


if MsgText[1]== 'مسح' and MsgText[2]== 'الردود' then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local names 	= redis:exists(mark..'replay:'..msg.chat_id_)
local photo 	= redis:exists(mark..'replay_photo:group:'..msg.chat_id_)
local voice 	= redis:exists(mark..'replay_voice:group:'..msg.chat_id_)
local imation   = redis:exists(mark..'replay_animation:group:'..msg.chat_id_)
local audio	 	= redis:exists(mark..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:exists(mark..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:exists(mark..'replay_video:group:'..msg.chat_id_)
if names or photo or voice or imation or audio or sticker or video then
redis:del(mark..'replay:'..msg.chat_id_,mark..'replay_photo:group:'..msg.chat_id_,mark..'replay_voice:group:'..msg.chat_id_,
mark..'replay_animation:group:'..msg.chat_id_,mark..'replay_audio:group:'..msg.chat_id_,mark..'replay_sticker:group:'..msg.chat_id_,mark..'replay_video:group:'..msg.chat_id_)
return "𖤐 تم مسح كل الردود ."
else
return '𖤐 ** لا يوجد ردود ليتم مسحها \n'
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود العامه' then
if not msg.SudoBase then return"𖤐 للمطورين فقط ." end
local names 	= redis:exists(mark..'replay:all')
local photo 	= redis:exists(mark..'replay_photo:group:')
local voice 	= redis:exists(mark..'replay_voice:group:')
local imation 	= redis:exists(mark..'replay_animation:group:')
local audio 	= redis:exists(mark..'replay_audio:group:')
local sticker 	= redis:exists(mark..'replay_sticker:group:')
local video 	= redis:exists(mark..'replay_video:group:')
if names or photo or voice or imation or audio or sticker or video then
redis:del(mark..'replay:all',mark..'replay_photo:group:',mark..'replay_voice:group:',mark..'replay_animation:group:',mark..'replay_audio:group:',mark..'replay_sticker:group:',mark..'replay_video:group:')
return "𖤐 تم مسح كل الردود العامه ."
else
return "𖤐 لا يوجد ردود عامه ليتم مسحها ."
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد عام' then
if not msg.SudoBase then return"𖤐 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:set(mark..'delrdall:'..msg.sender_user_id_,true) 
return "𖤐 حسننا عزيزي  .\n𖤐 الان ارسل الرد لمسحها من  المجموعات ."
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد' then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
redis:set(mark..'delrd:'..msg.sender_user_id_,true)
return "𖤐 حسننا عزيزي  .\n𖤐 الان ارسل الرد لمسحها من  للمجموعه ."
end

if MsgText[1]== 'الردود' then
if not msg.Director then return "𖤐 *│*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local names  	= redis:hkeys(mark..'replay:'..msg.chat_id_)
local photo 	= redis:hkeys(mark..'replay_photo:group:'..msg.chat_id_)
local voice  	= redis:hkeys(mark..'replay_voice:group:'..msg.chat_id_)
local imation 	= redis:hkeys(mark..'replay_animation:group:'..msg.chat_id_)
local audio 	= redis:hkeys(mark..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:hkeys(mark..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:hkeys(mark..'replay_video:group:'..msg.chat_id_)
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '𖤐 **لا يوجد ردود مضافه حاليا \n' 
end
local ii = 1
local message = '𖤐 **ردود البوت في المجموعه  :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره ) \n' 	 ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص ) \n'  	 ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..  voice[i]..' *}_*( بصمه ) \n' 	 ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه ) \n' ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه ) \n'  ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق ) \n' 	 ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو ) \n' ii = ii + 1 end
return message..'\n➖➖➖'
end

if MsgText[1]== 'الردود العامه' or MsgText[1]=='الردود العامه 🗨' then
if not msg.SudoBase then return "𖤐 للمطور فقط ." end
local names 	= redis:hkeys(mark..'replay:all')
local photo 	= redis:hkeys(mark..'replay_photo:group:')
local voice 	= redis:hkeys(mark..'replay_voice:group:')
local imation 	= redis:hkeys(mark..'replay_animation:group:')
local audio 	= redis:hkeys(mark..'replay_audio:group:')
local sticker 	= redis:hkeys(mark..'replay_sticker:group:')
local video 	= redis:hkeys(mark..'replay_video:group:')
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '𖤐 **لا يوجد ردود مضافه حاليا \n' 
end
local ii = 1
local message = '𖤐 **الردود العامه في البوت :   :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره ) \n' 	ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص ) \n'  	ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..	voice[i]..' *}_*( بصمه ) \n' 	ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه ) \n'ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه ) \n' ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق ) \n' 	ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو ) \n'ii = ii + 1 end
return message..'\n➖➖➖'
end


if MsgText[1]=="اضف رد" and msg.GroupActive then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
redis:setex(mark..'addrd:'..msg.chat_id_..msg.sender_user_id_,300,true) 
redis:del(mark..'replay1'..msg.chat_id_..msg.sender_user_id_)
return "𖤐 حسننا , الان ارسل كلمه الرد \n"
end

if MsgText[1] == "ضع اسم للبوت" or MsgText[1]== 'ضع اسم للبوت ©' then
if not msg.SudoBase then return"𖤐 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(mark..'namebot:witting'..msg.sender_user_id_,300,true)
return"𖤐 حسننا عزيزي .\n𖤐 الان ارسل الاسم  للبوت ."
end



if MsgText[1] == 'server' then
if not msg.SudoUser then return "𖤐 للمطور فقط." end
return io.popen([[

linux_version=`lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '📟 ❪ Seystem ❫\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*𖤐 ❪ Memory ❫\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*𖤐 ❪ HardDisk ❫\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*𖤐 ❪ Processor ❫\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*𖤐 ❪ Server[_]Login ❫\n*»» '`whoami`'*'
echo '*------------------------------\n*𖤐 ❪ Uptime ❫  \n*»» '"$uptime"'*'
]]):read('*all')
end


if MsgText[1] == 'السيرفر' then
if not msg.SudoUser then return "𖤐 للمطور فقط." end
return io.popen([[

linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo ' ( نظام التشغيل )\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*𖤐 ( الذاكره العشوائيه )\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*𖤐 ( وحـده الـتـخـزيـن )\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*𖤐 ( الـمــعــالــج )\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*𖤐 ❪ الــدخــول ❫\n*»» '`whoami`'*'
echo '*------------------------------\n*𖤐( مـده تـشغيـل الـسـيـرفـر )  \n*»» '"$uptime"'*'
]]):read('*all')
end


if msg.type == 'channel' and msg.GroupActive then
if MsgText[1] == "الاوامر" then
if not msg.Admin then return "↺ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n↺ " end
return [[
‌‌‏‌‌‏‌‏    ‌‌‏‌‌‏‌‌‌‌‏                                    
    ܁𖠐︙هناكـ {9} اوامر لعرضها
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
܁𖠐︙م1  » اوامر حماية المجموعه
܁𖠐︙م2 » اوامر ادمنية المجموعه
܁𖠐︙م3 » آوآمر آلوضع والمسح
܁𖠐︙م4 » آوآمر مدراء المجموعه
 ܁𖠐︙م5 » آوآمر التسليه القديمه
܁𖠐︙م6 » آوآمر منشئين المجموعه
܁𖠐︙م7 » اوآمر مطور اساسي
܁𖠐︙م8 » اوآمر تسليه الجديده
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ 
  ↺⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
 ⋆ يُـوزر المّـطور ⇽{ ]]..SUDO_USER..[[ } ✓ ]]
end
if MsgText[1]== 'م1' then
if not msg.Admin then return "↺ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n↺ " end
local text =[[     
܁𖠐︙ اوامر حماية المجموعه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ 
܁𖠐︙قفل ، فتح ← الامر 
܁𖠐︙تستطيع قفل حمايه كما يلي ...
܁𖠐︙← { بالتقيد ، بالطرد ، بالكتم }
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
܁𖠐︙ الدردشه
܁𖠐︙ الروابط
܁𖠐︙ المعرفات
܁𖠐︙ التاك
܁𖠐︙ الملصقات
܁𖠐︙ الفيديو
܁𖠐︙ الصور
܁𖠐︙ التوجيه
܁𖠐︙ البوتات
܁𖠐︙ الاشعارات
܁𖠐︙ التعديل
܁𖠐︙ الميديا
܁𖠐︙ الجهات
܁𖠐︙ الالعاب
܁𖠐︙ الملفات
܁𖠐︙ الكيبورد
܁𖠐︙ الماركداون
܁𖠐︙ الانلاين 
܁𖠐︙ الكلايش
܁𖠐︙ التكرار
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 ↺⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ 
 ⋆ يُـوزر المّـطور ⇽{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م2' then
if not msg.Admin then return "↺ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n↺ " end
local text = [[
܁𖠐︙اوامر ادمنية المجموعه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
܁𖠐︙كتم  رد , معرف ، ايدي 
܁𖠐︙حظر  رد , معرف ، ايدي 
܁𖠐︙تقيد  رد , معرف ، ايدي 
܁𖠐︙طرد  رد , معرف ، ايدي 
܁𖠐︙الغاء كتم  رد , معرف ، ايدي 
܁𖠐︙الغاء حظر  رد , معرف ، ايدي 
܁𖠐︙الغاء تقيد  رد , معرف ، ايدي 
܁𖠐︙المقيدين 
܁𖠐︙المكتومين  
܁𖠐︙المحظورين 
܁𖠐︙الترحيب
܁𖠐︙الصلاحيات
܁𖠐︙اضف صلاحيه + اسم الصلاحيه
܁𖠐︙مسح صلاحيه + اسم الصلاحيه
܁𖠐︙الاعدادات 
܁𖠐︙كشف البوتات
܁𖠐︙منع / الغاء منع
܁𖠐︙تعطيل / تفعيل الترحيب
܁𖠐︙تثبيت / الغاء التثبيت
܁𖠐︙ضع تكرار + العدد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 ↺⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
————————————————
 ⋆ يُـوزر المّـطور ⇽{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م3' then
if not msg.Director then return "↺ **هذا الامر يخص {المطور,المنشئ,المدير,المطور} فقط  \n↺ " end
local text = [[
܁𖠐︙اوامر الوضع والمسح
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
܁𖠐︙وضع صوره
܁𖠐︙وضع وصف 
܁𖠐︙وضع اسم + اسم
܁𖠐︙ ضع رابط
܁𖠐︙ ضع قوانين
܁𖠐︙ ضع ترحيب
܁𖠐︙ كشف بالرد
܁𖠐︙ كشف بالمعرف
܁𖠐︙تنظيف +العدد
܁𖠐︙المنشئين
܁𖠐︙المدراء
܁𖠐︙الادمنيه
܁𖠐︙المميزين
܁𖠐︙مسح الادمنيه 
܁𖠐︙مسح المميزين
܁𖠐︙مسح المكتومين
܁𖠐︙مسح المحظورين
܁𖠐︙مسح البوتات
܁𖠐︙مسح الرابط
܁𖠐︙مسح الترحيب
܁𖠐︙مسح القوانين
܁𖠐︙مسح قائمه المنع
܁𖠐︙وضع ترحيب
܁𖠐︙تفعيل / تعطيل الترحيب
܁𖠐︙تاك للكل
܁𖠐︙تنزيل الكل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 ↺⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ 
 ⋆ يُـوزر المّـطور ⇽{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م4' then
if not msg.Admin then return "↺ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n↺ " end
local text =[[

܁𖠐︙آوامر المدراء المجموعه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
܁𖠐︙رفع / تنزيل ادمن
܁𖠐︙رفع / تنزيل مميز
܁𖠐︙رفع الادمنيه
܁𖠐︙المعلومات + ايدي
܁𖠐︙الحساب + ايدي
܁𖠐︙الادمنيه
܁𖠐︙المميزين
܁𖠐︙تعين الايدي
܁𖠐︙مسح الايدي
܁𖠐︙ اضف/حذف رد
܁𖠐︙ ردود المدير
܁𖠐︙مسح ردود المدير
܁𖠐︙رفع القيود
܁𖠐︙كشف القيود
܁𖠐︙منع على (متحركه) بالرد
܁𖠐︙منع على (صوره) بالرد
܁𖠐︙منع على (ملصق) بالرد
܁𖠐︙ تعطيل/تفعيل ردود المدير
܁𖠐︙ تعطيل/تفعيل ردود المطور
܁𖠐︙تعطيل/تفعيل الايدي بالصوره
܁𖠐︙تعطيل/تفعيل الالعاب
܁𖠐︙تعطيل/تفعيل صيح
܁𖠐︙تعطيل/تفعيل ضافني
܁𖠐︙تعطيل/تفعيل الايدي
܁𖠐︙تعطيل/تفعيل اطردني
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 ↺⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
 ⋆ يُـوزر المّـطور ⇽{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م5' then
if not msg.Admin then return "↺ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n↺ " end
local text =[[
⋆ اوامـر التسليـه .
 ↺مرحباً عزيزي 
 ↺إليـك اوامر التسليـه كـ التالي
 ↺⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
      
 ↺رفع ⟷ تنزيل ⇽ تـــاج 
 ↺رفع ⟷ تنزيل ⇽ زوجتي 
 ↺رفع ⟷ تنزيل ⇽ حمار 
 ↺رفع ⟷ تنزيل ⇽ كلب  
 ↺رفع ⟷ تنزيل ⇽ مطرب 
 ↺رفع ⟷ تنزيل ⇽ درج 
 ↺رفع ⟷ تنزيل ⇽ زاحف 
 ↺رفع ⟷ بقلبي تنزيل ⇽ من قلبي 
 ↺طلاق ⟷ زواج 
 ↺⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
 ⋆ يُـوزر المّـطور ⇽{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م6' then
if not msg.Admin then return "↺ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n↺ " end
local text = [[     
܁𖠐︙اوامر منشئين المجموعه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ 
܁𖠐︙تفعيل / تعطيل
܁𖠐︙ اضف امر
܁𖠐︙ حذف امر
܁𖠐︙ الاوامر المضافه
܁𖠐︙ حذف الاوامر المضافه
܁𖠐︙مسح المنشئين
܁𖠐︙رفع/تنزيل منشئ
܁𖠐︙المنشئين
܁𖠐︙رفع/تنزيل مدير
܁𖠐︙المدراء
܁𖠐︙مسح المدراء
܁𖠐︙ رفع ادمن بالكروب
܁𖠐︙ تنزيل ادمن بالكروب
܁𖠐︙ رفع ادمن بكل الصلاحيات
܁𖠐︙ تنزيل ادمن بكل الصلاحيات
܁𖠐︙ تفعيل/تعطيل الحظر
܁𖠐︙ تفعيل/تعطيل الرفع
܁𖠐︙ تفعيل/تعطيل الردود
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 ↺⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
 ⋆ يُـوزر المّـطور ⇽{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م7' then
if not msg.Admin then return "↺ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n↺ " end
local text = [[
܁𖠐︙اوامر المطور الاساسي
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
܁𖠐︙تحديث السورس 
܁𖠐︙ضع شرط التفعيل + العدد
܁𖠐︙تفعيل / تعطيل الوضع الخدمي
܁𖠐︙ تفعيل/تعطيل الاذاعه
܁𖠐︙ تفعيل/تعطيل التواصل
܁𖠐︙ تفعيل/تعطيل المغادره
܁𖠐︙رفع المنشئ
܁𖠐︙ المنشئ
܁𖠐︙ مسح الاساسين
܁𖠐︙ المنشئين الاساسين
܁𖠐︙ رفع/تنزيل منشئ اساسي
܁𖠐︙اذاعه خاص / اذاعه
܁𖠐︙ اذاعه بالتوجيه
܁𖠐︙ اذاعه بالتوجيه خاص
܁𖠐︙اسم البوت + غادر
܁𖠐︙تغير اسم البوت
܁𖠐︙اضف/حذف رد عام
܁𖠐︙ تنظيف المشتركين
܁𖠐︙ تنظيف المجموعات
܁𖠐︙ضع كليشه المطور
܁𖠐︙الاحصائيات
܁𖠐︙المشتركين
܁𖠐︙المطورين
܁𖠐︙رفع / تنزيل هكر
܁𖠐︙مسح المطورين 
܁𖠐︙حضر عام
܁𖠐︙الغاء العام
܁𖠐︙قائمه العام
܁𖠐︙مسح قائمه العام
܁𖠐︙نسخه احتياطيه للمجموعات
܁𖠐︙ رفع النسخه الاحتياطيه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉   
 ↺⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
 ⋆ يُـوزر المّـطور ⇽{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م8' then
if not msg.Admin then return "⸙ **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n⸙ " end
local text =[[
 اوامـر التسليـه الجديده
 ↺مرحباً عزيزي 
 ↺إليـك اوامر التسليـه كـ التالي
 ↺⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
↺مرحباً عزيزي 
 ↺إليـك اوامر التسليـه الجديده
↺رفع⟷تنزيل⇽حياتي
↺رفع⟷تنزيل⇽بيست
↺رفع⟷تنزيل⇽تونز
↺رفع⟷تنزيل⇽شاذ
↺رفع⟷تنزيل⇽سندي
↺رفع⟷تنزيل⇽علق
↺رفع⟷تنزيل⇽السندريلا
↺رفع⟷تنزيل⇽عرص
↺رفع⟷تنزيل⇽خول
↺رفع⟷تنزيل⇽متناك
↺رفع⟷تنزيل⇽شرموط
↺رفع⟷تنزيل⇽بكس
↺رفع⟷تنزيل⇽معرص
 ↺⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
 ⋆ يُـوزر المّـطور ⇽{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1]== "م المطور" then
if not msg.SudoBase then return "𖤐 للمطور الاساسي فقط  🎖" end
local text = [[     
↤︎ ❬اوامـر المطـور❭ 
————————————————
𖤐 تفعيـل ◄► ❬لتفعيل البوت ❭
𖤐 تعطيل ◄► ❬لتعطيل البوت ❭
𖤐 رفع منشى ◄► ❬رفع منشى بالبوت❭
————————————————
𖤐 اذاعه ◄► ❬لنشر رساله لكل المجموعات❭
𖤐 اذاعه خاص ◄► ❬ لنشر رساله لكل المشتركين خاص❭
𖤐 اذاعه عام ◄► ❬لنشر رساله لكل المجموعات والخاص❭
𖤐 اذاعه عام بالتوجيه ◄► ❬لنشر منشور قناتك بابتوجيه للكل❭
𖤐 تنظيف المجموعات◄►  ❬لمسح المجموعات الوهميه❭
تنظيف المشتركين ◄► ❬لمسح المشتركين الوهميين❭
————————————————
𖤐 تحديث ◄► ❬لتحديث ملفات البوت❭
𖤐 تحديث السورس ◄► ❬لتحديث السورس الى اصدار احدث❭
————————————————
 ⋆ يُـوزر المّـطور ⇽{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'اوامر الرد' then
if not msg.Director then return "𖤐 **هذا الامر يخص {المطور,المنشئ,المدير,المطور} فقط  \n𖤐 " end
local text = [[     
↤︎❬جميع اوامر الردود ❭
————————————————
𖤐 الردود ◄► لعرض الردود المثبته
𖤐 اضف رد ◄► لأضافه رد جديد
𖤐 مسح رد ◄► الرد المراد مسحه
𖤐 مسح الردود ◄► لمسح كل الردود
𖤐 الردود العامه ◄► لمعرف الردود المثبته عام 
𖤐 اضف رد عام ◄► لاضافه رد لكل المجموعات
𖤐 مسح رد عام  ◄► لمسح الرد العام 
𖤐 مسح الردود العامه ◄► لمسح كل ردود العامه
————————————————
 ⋆ يُـوزر المّـطور ⇽{ ]]..SUDO_USER..[[ } ✓ ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1] == "تفعيل" and MsgText[2] == "اطردني"  then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n𖤐 " end
if not redis:get(mark..'lave_me'..msg.chat_id_) then 
return "𖤐 **أهلا عزيزي "..msg.TheRankCmd.."\n𖤐 ** المغادره بالتاكيد تم تفعيلها\n✓" 
else 
redis:del(mark..'lave_me'..msg.chat_id_) 
return "𖤐 **أهلا عزيزي "..msg.TheRankCmd.."\n𖤐 ** تم تفعيل المغادره \n✓" 
end 
end
if MsgText[1] == "تعطيل" and MsgText[2] == "اطردني" then
if not msg.Admin then return "𖤐 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n𖤐 " end
if redis:get(mark..'lave_me'..msg.chat_id_) then 
return "𖤐 **أهلا عزيزي "..msg.TheRankCmd.."\n𖤐 ** المغادره من قبل البوت بالتأكيد معطله\n✓" 
else
redis:set(mark..'lave_me'..msg.chat_id_,true)  
return "𖤐 **أهلا عزيزي "..msg.TheRankCmd.."\n𖤐 ** تم تعطيل المغادره من قبل البوت\n✓" 
end   
end

if MsgText[1] == "اطردني" or MsgText[1] == "احظرني" then
if not redis:get(mark..'lave_me'..msg.chat_id_) then
if msg.Admin then return "𖤐 **لا استطيع طرد المدراء والادمنيه والمنشئين  \n𖤐 " end
kick_user(msg.sender_user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
StatusLeft(msg.chat_id_,msg.sender_user_id_)
send_msg(msg.sender_user_id_,"𖤐 أهلاً عزيزي , لقد تم طردك من المجموعه بامر منك \n𖤐 اذا كان هذا بالخطأ او اردت الرجوع للمجموعه \n\n𖤐 فهذا رابط المجموعه\n𖤐 "..Flter_Markdown(redis:get(mark..'group:name'..msg.chat_id_)).." :\n\n["..redis:get(mark..'linkGroup'..msg.chat_id_).."]\n")
sendMsg(msg.chat_id_,msg.id_,"𖤐 لقد تم طردك بنجاح , ارسلت لك رابط المجموعه في الخاص اذا وصلت لك تستطيع الرجوع متى شئت ")
else
sendMsg(msg.chat_id_,msg.id_,"𖤐  لا استطيع طردك لانك مشرف في المجموعه  ")
end
end)
return false
end
end

end 

if MsgText[1] == "السورس" or MsgText[1]=="سورس" then
return [[
; 𝙨𝙤𝙪𝙧𝙘𝙚 𝙢𝙖𝙧𝙠 ⁦ਊ 

[𝘥𝘦𝘷𝘦𝘭𝘰𝘱𝘦𝘳](https://t.me/eljo_ker_m)

 [𝘥𝘦𝘷𝘦𝘭𝘰𝘱𝘦𝘳](https://t.me/QpSSpQ)

 [𝘥𝘦𝘷𝘦𝘭𝘰𝘱𝘦𝘳](https://t.me/pabl0oooo)

[𝘤𝘰𝘮𝘮𝘶𝘯𝘪𝘤𝘢𝘵𝘪𝘰𝘯 𝄬](https://t.me/MARK_5)
]]
end


if MsgText[1] == "التاريخ" then
return "\n𖤐  الـتـاريـخ : "..os.date("%Y/%m/%d")
end

if MsgText[1]== "سحكاتي" then
return '𖤐 **عدد سحكاتك ⇜ ❪ '..(redis:get(mark..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ❫ \n'
end

if MsgText[1] == 'مسح' and MsgText[2] == 'سحكاتي'  then
local rfih = (redis:get(mark..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
if rfih == 0 then  return "𖤐 *│* لا يوجد سحكات لك في البوت ." end
redis:del(mark..':edited:'..msg.chat_id_..':'..msg.sender_user_id_)
return "𖤐 *│*تم مسح {* "..rfih.." *} من سحكاتك .\n"
end

if MsgText[1] == "تفعيل الاشتراك الاجباري" or MsgText[1] == "تفعيل الاشتراك الاجباري ☑" then
if not msg.SudoBase then return"𖤐 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
if redis:get(mark..":UserNameChaneel") then
return "𖤐 اهلا عزيزي المطور \n𖤐 الاشتراك بالتأكيد مفعل"
else
redis:setex(mark..":ForceSub:"..msg.sender_user_id_,350,true)
return "𖤐 مرحبا بـك في نظام الاشتراك الاجباري\n𖤐 الان ارسل معرف قـنـاتـك"
end
end

if MsgText[1] == "تعطيل الاشتراك الاجباري" or MsgText[1] == "تعطيل الاشتراك الاجباري ♻️" then
if not msg.SudoBase then return"𖤐 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
local SubDel = redis:del(mark..":UserNameChaneel")
if SubDel == 1 then
return "𖤐 تم تعطيل الاشتراك الاجباري . \n✓"
else
return "𖤐 الاشتراك الاجباري بالفعل معطل . \n✓"
end
end

if MsgText[1] == "الاشتراك الاجباري" or MsgText[1] == "الاشتراك الاجباري ⚠️" then
if not msg.SudoBase then return"𖤐 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
local UserChaneel = redis:get(mark..":UserNameChaneel")
if UserChaneel then
return "𖤐 اهلا عزيزي المطور \n𖤐 الاشتراك الاجباري للقناة : ["..UserChaneel.."]\n"
else
return "𖤐 لا يوجد قناة مفعله على الاشتراك الاجباري . \n"
end
end

if MsgText[1] == "تغيير الاشتراك الاجباري" or MsgText[1] == "تغيير الاشتراك الاجباري 🔁" then
if not msg.SudoBase then return"𖤐 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(mark..":ForceSub:"..msg.sender_user_id_,350,true)
return "𖤐 مرحبا بـك في نظام الاشتراك الاجباري\n𖤐 الان ارسل معرف قـنـاتـك"
end





end

local function dmark(msg)



local getChatId = function(id)
  local chat = {}
  local id = tostring(id)
  if id:match("^-100") then
    local channel_id = id:gsub("-100", "")
    chat = {ID = channel_id, type = "channel"}
  else
    local group_id = id:gsub("-", "")
    chat = {ID = group_id, type = "group"}
  end
  return chat
end
local getChannelFull = function(channel_id, cb)
  tdcli_function({
    ID = "GetChannelFull",
    channel_id_ = getChatId(channel_id).ID
  }, cb or dl_cb, nil)
end

local getUser = function(user_id, cb)
tdcli_function({ID = "GetUser", user_id_ = user_id}, cb, nil)
end
local getChat = function(chat_id, cb)
tdcli_function({ID = "GetChat", chat_id_ = chat_id}, cb or dl_cb, nil)
end


if redis:get(mark..'welc'..msg.chat_id_) == 'on' then
if msg.content_.ID == 'MessageChatJoinByLink' then
function WelcomeByAddUser(BlaCk,Diamond)
local function setlinkgp(td,mrr619)
function gps(arg,data)

txt = '𖤐 اهلآ عزيزي '..(Diamond.first_name_ or '---')..'\n𖤐 المجموعه  '..(data.title_ or '---')..' \n𖤐 احترام الادمنيه\n𖤐 ممنوع طلب الرتب\n𖤐 ممنوع السب \n𖤐 ممنوع التكلم بالسياسة\n𖤐 الاعضاء '..mrr619.member_count_..' عضو\n𖤐 الادمنيه '..mrr619.administrator_count_..' \n𖤐 وقت الانضمام :【*'..os.date("%H:%M:%S")..'*】\n𖤐 تاريخ الانضمام :【*'..os.date("%Y/%m/%d")..'*】\n'
sendMsg(msg.chat_id_,msg.id_,txt)
end
getChat(msg.chat_id_,gps)
end
getChannelFull(msg.chat_id_,setlinkgp)
end
getUser(msg.sender_user_id_,WelcomeByAddUser)
end
end



local Text = msg.text
if Text then


if Text and (Text:match('(.*)')) and tonumber(msg.sender_user_id_) ~= 0 then
function dl_username(arg,data)
if data.username_ then
info = data.username_
else
info = data.first_name_
end
local hash = mark..'user_names:'..msg.sender_user_id_
redis:set(hash,info)
end
getUser(msg.sender_user_id_,dl_username)
end

------set cmd------
Black = msg.text 
if Black == 'رفع مشرف كامل' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "𖤐 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط ." end

function setadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'𖤐 البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'𖤐 الأسم : ['..data.first_name_..'](tg://user?id='..diamond.sender_user_id_..')\n𖤐 تم رفعه مشرف بكامل الصلاحيات\n‏‏')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},setadmins,nil)

return false

end




if Black == 'رفع مشرف' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "𖤐 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط ." end

function setadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'𖤐 البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'𖤐 الأسم : ['..data.first_name_..'](tg://user?id='..diamond.sender_user_id_..')\n𖤐 تم رفعه مشرف \n‏')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},setadmins,nil)

return false

end




if Black == 'تنزيل مشرف' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "𖤐 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط ." end

function remadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'𖤐 البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'𖤐 الأسم : ['..data.first_name_..'](tg://user?id='..diamond.sender_user_id_..')\n𖤐 تم ازالته من الاشراف\n‏')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},remadmins,nil)

return false

end




if Black == 'تنزيل مشرف' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "𖤐 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط ." end

function remadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'𖤐 البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'𖤐 الأسم : ['..data.first_name_..'](tg://user?id='..diamond.sender_user_id_..')\n𖤐 تم إزالته من الاشراف')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},remadmins,nil)

return false

end
mmd = redis:get(mark..'addcmd'..msg.chat_id_..msg.sender_user_id_)
if mmd then
redis:sadd(mark..'CmDlist:'..msg.chat_id_,msg.text)
redis:hset(mark..'CmD:'..msg.chat_id_,msg.text,mmd)
sendMsg(msg.chat_id_,msg.id_,'𖤐 اهلا عزيزي \n𖤐 تم تثبيت الامر الجديد\n✓')
redis:del(mark..'addcmd'..msg.chat_id_..msg.sender_user_id_)
end

if Black:match('تغير امر (.*)') then
if not msg.Kara then return "𖤐 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
local cmd = Black:match('تغير امر (.*)') 
redis:setex(mark..'addcmd'..msg.chat_id_..msg.sender_user_id_,120,cmd)
sendMsg(msg.chat_id_,msg.id_,'𖤐 اهلا بك عزيزي\n𖤐 الامر الي تريد تغيره الي  "'..cmd..'" \n𖤐 ارسله الان\n')
end

if Black and (Black:match('^delcmd (.*)') or Black:match('^مسح امر (.*)')) then
if not msg.Kara then return "𖤐 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
local cmd = Black:match('^delcmd (.*)') or Black:match('^مسح امر (.*)')
redis:hdel(mark..'CmD:'..msg.chat_id_,cmd)
redis:srem(mark..'CmDlist:'..msg.chat_id_,cmd)
sendMsg(msg.chat_id_,msg.id_,"𖤐 اهلا عزيزي\nالامر >"..cmd.."\n𖤐 تم مسحه من قائمه الاوامر\n")
end
if Black == 'مسح قائمه الاوامر' or Black == 'مسح قائمه الاوامر' then
if not msg.Kara then return "𖤐 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
redis:del(mark..'CmD:'..msg.chat_id_)
redis:del(mark..'CmDlist:'..msg.chat_id_)
sendMsg(msg.chat_id_,msg.id_,"𖤐 اهلا عزيزي تم مسح قائمه الاوامر")
end
if Black == "قائمه الاوامر" then
if not msg.Kara then return "𖤐 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
local CmDlist = redis:smembers(mark..'CmDlist:'..msg.chat_id_)
local t = '𖤐 قائمه الاوامر : \n'
for k,v in pairs(CmDlist) do
mmdi = redis:hget(mark..'CmD:'..msg.chat_id_,v)
t = t..k..") "..v.." > "..mmdi.."\n" 
end
if #CmDlist == 0 then
t = '𖤐 عزيزي لم تقم ب اضافه امر .'
end
sendMsg(msg.chat_id_,msg.id_,t)
end




if Black == 'welcome on' or Black == 'تفعيل الترحيب' then
if redis:get(mark..'welc'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل الترحيب سابقا')
else
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل الترحيب')
redis:set(mark..'welc'..msg.chat_id_,'on')
end
end
if Text == 'welcome off' or Text == 'تعطيل الترحيب' then
if redis:get(mark..'welc'..msg.chat_id_) == 'off' then
sendMsg(msg.chat_id_,msg.id_,'تم تعطيل الترحيب سابقا')
redis:set(mark..'welc'..msg.chat_id_,'off')
redis:del(mark..'welc'..msg.chat_id_,'on')
else
sendMsg(msg.chat_id_,msg.id_,'تم تعطيل الترحيب')
end
end

if Black == 'welcome on' or Black == 'تفعيل المطور' then
if redis:get(mark..'welc'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل المطور سابقا')
else
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل المطور')
redis:set(mark..'welc'..msg.chat_id_,'on')
end
end
if Text == 'welcome off' or Text == 'تعطيل المطور' then
if redis:get(mark..'welc'..msg.chat_id_) == 'off' then
sendMsg(msg.chat_id_,msg.id_,'تم تعطيل المطور سابقا')
redis:set(mark..'welc'..msg.chat_id_,'off')
redis:del(mark..'welc'..msg.chat_id_,'on')
else
sendMsg(msg.chat_id_,msg.id_,'تم تعطيل المطور')
end
end

if Text == "join on" and msg.SudoUser then
redis:set(mark..'joinchnl',true)
sendMsg(msg.chat_id_,msg.id_,'on')
end
if Text and redis:get(mark..'setchs') and msg.SudoUser then
redis:set(mark..'setch',Text)
sendMsg(msg.chat_id_,msg.id_,'تم تعين القناه علي \n'..Text)
redis:del(mark..'setchs')
end
if Text and (Text:match("^setch$")) and msg.SudoUser then
sendMsg(msg.chat_id_,msg.id_,'ارسل معرفك بدون @')
redis:setex(mark..'setchs',120,true)
end


if Text == 'time' or Text == 'الوقت' and is_JoinChannel(msg) then
local colors = {'blue','green','yellow','magenta','Orange','DarkOrange','red'}
local fonts = {'mathbf','mathit','mathfrak','mathrm'}
local url1 = 'http://latex.codecogs.com/png.download?'..'\\dpi{600}%20\\huge%20\\'..fonts[math.random(#fonts)]..'{{\\color{'..colors[math.random(#colors)]..'}'..os.date("%H:%M")..'}}'	
file = download_to_file(url1,'time.webp')

print('TIMESSSS')
sendDocument(msg.chat_id_,msg.id_,file,'',dl_cb,nil)
end
if Text:match('^tosticker$') or Text:match('^تحويل ملصق$') and tonumber(msg.reply_to_message_id_) > 0 then
whoami()
BD = '/home/root/.telegram-cli/data/'
function tosticker(arg,data)
if data.content_.ID == 'MessagePhoto' then
if BD..'photo/'..data.content_.photo_.id_..'_(1).jpg' == '' then
pathf = BD..'photo/'..data.content_.photo_.id_..'.jpg'
else
pathf = BD..'photo/'..data.content_.photo_.id_..'_(1).jpg'
end
sendSticker(msg.chat_id_,msg.id_,pathf,'')
else
sendMsg(msg.chat_id_,msg.id_,'𖤐 عزيزي المستخدم\n𖤐 الامر فقط للصوره\n')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tosticker, nil)
end

if Text == 'tophoto' or Text == 'صوره' and tonumber(msg.reply_to_message_id_) > 0 then
function tophoto(kara,mark)   
if mark.content_.ID == "MessageSticker" then        
local bd = mark.content_.sticker_.sticker_.path_          
sendPhoto(msg.chat_id_,msg.id_,bd,'')
else
sendMsg(msg.chat_id_,msg.id_,'𖤐 عزيزي المستخدم\n𖤐 الامر فقط للملصق\n✓')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tophoto, nil)
end
end

if msg.type == "pv" then 

if not msg.SudoUser then
local msg_pv = tonumber(redis:get(mark..'user:'..msg.sender_user_id_..':msgs') or 0)
if msg_pv > 5 then
redis:setex(mark..':mute_pv:'..msg.sender_user_id_,18000,true)   
return sendMsg(msg.chat_id_,0,'*𖤐 * تم حظرك من البوت بسبب التكرار \n') 
end
redis:setex(mark..'user:'..msg.sender_user_id_..':msgs',2,msg_pv+1)
end

if msg.text=="/start" then 

if msg.SudoBase then
local text = '- شكراً لك لإستخدام سورس مارك\n- أنت المطور الاساسي هنا\n—————————\n\n- يمكنك الأن التحكم بأوامر البوت عن طريق لوحة التحكم بالبوت\nفقط انقر على الأمر الذي اريده‏'
local keyboard = {
{"★  أّلَمًبًرمًجّ أّلَأّسِـأّسِـى ★"},
{"★  وٌأّتٌـسِـأّبً أّلَمًبًرمًجّ أّلَأّسِـأّسِـى ★"},
{"★ ^ ★"},
{"المبرمج الجوكر"},
{"مهدي المالك"},
{"ضع اسم للبوت","ضع صوره للترحيب"},
{"تفعيل المطور","تعطيل المطور"},
 {"تعطيل التواصل","تفعيل التواصل"},
{"تعطيل البوت خدمي","تفعيل البوت خدمي","المطورين"},
 {"المشتركين","المجموعات","الاحصائيات"},
 {"اضف رد عام","الردود العامه"},
 {"اذاعه","اذاعه خاص"},
{"اذاعه عام","اذاعه عام بالتوجيه"},
 {"تحديث","قائمه العام","ايديي"},
{"تعطيل الاشتراك الاجباري","تفعيل الاشتراك الاجباري"},
{"تغيير الاشتراك الاجباري","الاشتراك الاجباري"},
{"تنظيف المشتركين","تنظيف المجموعات"},
{"نسخه احتياطيه للمجموعات","رفع نسخه الاحتياطيه"},
 {"رفع نسخه الاحتياطيه"},
 {"تحديث السورس"},
 {"قناة السورس"},
 {"الغاء"}}
return send_key(msg.sender_user_id_,text,keyboard,nil,msg.id_)
else
redis:sadd(mark..'users',msg.sender_user_id_)
if redis:get(mark..'lock_service') then 
text = [[𖤐 أهلاً انا بوت   []]..redis:get(mark..':NameBot:')..[[] 🗽
𖤐 أختصاصي حماية المجموعات ..
𖤐 مـن السبام والتوجيه والتكرار والخ..
𖤐 لتفعيل البوت اتبع الشـروط ..
1- اضف البوت الى المجموعه
2- ارفع البوت مشرف في المجموعه
2- ارسل تفعيل وسيتم تفعيل البوت ورفع مشرفي القررب تلقائياً .

ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
 𖤐 مـعـرف الـمـطـــور : ]]..SUDO_USER..[[
]]
else
text = [[𖤐 أهلاً انا بوت    []]..redis:get(mark..':NameBot:')..[[] 🗽
𖤐 أختصاصي حماية المجموعات ..
𖤐 مـن السبام والتوجيه والتكرار والخ..
𖤐 لتفعيل البوت اتبع الشـروط ..
1- اضف البوت الى المجموعه
2- ارفع البوت مشرف في المجموعه
2- ارسل تفعيل وسيتم تفعيل البوت ورفع مشرفي القررب تلقائياً .

ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
 𖤐 مـعـرف الـمـطـــور : ]]..SUDO_USER..[[
]]
end
xsudouser = SUDO_USER:gsub('@','')
xsudouser = xsudouser:gsub([[\_]],'_')
local inline = {{{text="مـطـور الـبـوت ✓",url="t.me/"..xsudouser}}}
send_key(msg.sender_user_id_,text,nil,inline,msg.id_)
return false
end
end
 
if msg.SudoBase then
if msg.reply_id and msg.text ~= "رفع نسخه الاحتياطيه" then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,datainfo)
if datainfo.forward_info_ then
local FwdUser = datainfo.forward_info_.sender_user_id_
local FwdDate = datainfo.forward_info_.date_
GetUserID(FwdUser,function(arg,data)
local MSG_ID = (redis:get(mark.."USER_MSG_TWASEL"..FwdDate) or 1)
if msg.text then
sendMsg(FwdUser,MSG_ID,Flter_Markdown(msg.text))
elseif msg.sticker then
sendSticker(FwdUser,MSG_ID,sticker_id,msg.content_.caption_ or '')
elseif msg.photo then
sendPhoto(FwdUser,MSG_ID,photo_id,msg.content_.caption_ or '')
elseif msg.voice then
sendVoice(FwdUser,MSG_ID,voice_id,msg.content_.caption_ or '')
elseif msg.animation then
sendAnimation(FwdUser,MSG_ID,animation_id,msg.content_.caption_ or '')
elseif msg.video then
sendVideo(FwdUser,MSG_ID,video_id,msg.content_.caption_ or '')
elseif msg.audio then
sendAudio(FwdUser,MSG_ID,audio_id,msg.content_.caption_ or '')
end 

if data.username_ then 
USERNAME = '@'..data.username_
else 
USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or ""),20) 
end
USERCAR = utf8.len(USERNAME)

SendMention(msg.sender_user_id_,data.id_,msg.id_,"𖤐 تم ارسال الرسالة .\n𖤐 إلى : "..USERNAME.." .",39,USERCAR) 
return false 
end,nil)
end  
end,nil)
end 
else
if not redis:get(mark..'lock_twasel') then
if msg.forward_info_ or msg.sticker or msg.content_.ID == "MessageUnsupported" then
sendMsg(msg.chat_id_,msg.id_,"𖤐 عذراً لا يمكنك ارسال { توجيه‌‏ , ملصق , فديو كام} .")
return false
end
redis:setex(mark.."USER_MSG_TWASEL"..msg.date_,43200,msg.id_)
sendMsg(msg.chat_id_,msg.id_,"𖤐 تم آرسـآل رسالتك إلى المطور\n𖤐 سـآرد عليك في اقرب وقت ممكن \n𖤐 معرف المطور "..SUDO_USER)
tdcli_function({ID='GetChat',chat_id_ = SUDO_ID},function(arg,data)
fwdMsg(SUDO_ID,msg.chat_id_,msg.id_)
end,nil)
return false
end
end
end

--====================== Reply Only Group ====================================
if redis:get(mark..'addrd:'..msg.chat_id_..msg.sender_user_id_) and redis:get(mark..'replay1'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(mark..'replay1'..msg.chat_id_..msg.sender_user_id_)
if msg.text then 
redis:hset(mark..'replay:'..msg.chat_id_,klma,Flter_Markdown(msg.text))
redis:del(mark..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n𖤐 تم اضافت الرد . \n-')
elseif msg.photo then 
redis:hset(mark..'replay_photo:group:'..msg.chat_id_,klma,photo_id)
redis:del(mark..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'𖤐 تم اضافه صوره للرد بنجاح\n𖤐 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوره الاتيه ')
elseif msg.voice then
redis:hset(mark..'replay_voice:group:'..msg.chat_id_,klma,voice_id)
redis:del(mark..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'𖤐 تم اضافه بصمه صوت للرد بنجاح\n𖤐 يمكنك ارسال ❴ ['..klma..'] ❵ لسماع البصمه الاتيه ')
elseif msg.animation then
redis:hset(mark..'replay_animation:group:'..msg.chat_id_,klma,animation_id)
redis:del(mark..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'𖤐 تم اضافه متحركه للرد بنجاح\n𖤐 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوره الاتيه ')
elseif msg.video then
redis:hset(mark..'replay_video:group:'..msg.chat_id_,klma,video_id)
redis:del(mark..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'𖤐 تم اضافه فيديو للرد بنجاح\n𖤐 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الفيديو الاتي ')
elseif msg.audio then
redis:hset(mark..'replay_audio:group:'..msg.chat_id_,klma,audio_id)
redis:del(mark..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'𖤐 تم اضافه للصوت للرد بنجاح\n𖤐 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوت الاتي ')
elseif msg.sticker then
redis:hset(mark..'replay_sticker:group:'..msg.chat_id_,klma,sticker_id)
redis:del(mark..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'𖤐 تم اضافه ملصق للرد بنجاح\n𖤐 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الملصق الاتي ')
end  

end

--====================== Reply All Groups =====================================
if redis:get(mark..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) and redis:get(mark..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(mark..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
if msg.text then
redis:hset(mark..'replay:all',klma,Flter_Markdown(msg.text))
redis:del(mark..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  𖤐 تم اضافت الرد لكل المجموعات . ')
elseif msg.photo then 
redis:hset(mark..'replay_photo:group:',klma,photo_id)
redis:del(mark..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'𖤐 تم اضافه صوره للرد العام\n𖤐 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوره الاتيه ')
elseif msg.voice then
redis:hset(mark..'replay_voice:group:',klma,voice_id)
redis:del(mark..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'𖤐 تم اضافه بصمه صوت للرد العام\n𖤐 يمكنك ارسال ❴ ['..klma..'] ❵ لسماع البصمه الاتيه ')
elseif msg.animation then
redis:hset(mark..'replay_animation:group:',klma,animation_id)
redis:del(mark..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'𖤐 تم اضافه متحركه للرد العام\n𖤐 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوره الاتيه ')
elseif msg.video then
redis:hset(mark..'replay_video:group:',klma,video_id)
redis:del(mark..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'𖤐 تم اضافه فيديو للرد العام\n𖤐 يمكنك ارسال ❴ ['..klma..'] ❵لأظهار الفيديو الاتي ')
elseif msg.audio then
redis:hset(mark..'replay_audio:group:',klma,audio_id)
redis:del(mark..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'𖤐 تم اضافه للصوت للرد العام\n𖤐 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوت الاتي ')
elseif msg.sticker then
redis:hset(mark..'replay_sticker:group:',klma,sticker_id)
redis:del(mark..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'𖤐 تم اضافه ملصق للرد العام\n𖤐 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الملصق الاتي ')
end  

end

if msg.text then
--====================== Requst UserName Of Channel For ForceSub ==============
if redis:get(mark..":ForceSub:"..msg.sender_user_id_) then
if msg.text:match("^@[%a%d_]+$") then
redis:del(mark..":ForceSub:"..msg.sender_user_id_)
local url , res = https.request(ApiToken..'/getchatmember?chat_id='..msg.text..'&user_id='..msg.sender_user_id_)
if res == 400 then
local Req = JSON.decode(url)
if Req.description == "Bad Request: chat not found" then 
sendMsg(msg.chat_id_,msg.id_,"𖤐 عذراً , هناك خطأ لديك \n𖤐 المعرف الذي ارسلته ليس معرف قناة.")
return false
elseif Req.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
sendMsg(msg.chat_id_,msg.id_,"𖤐 عذراً , لقد نسيت شيئا \n𖤐 يجب رفع البوت مشرف في قناتك لتتمكن من تفعيل الاشتراك الاجباري .")
return false
end
else
redis:set(mark..":UserNameChaneel",msg.text)
sendMsg(msg.chat_id_,msg.id_,"𖤐 جـيـد , الان لقد تم تفعيل الاشتراك الاجباري\n𖤐 على قناتك ⇜ ["..msg.text.."]")
return false
end
else
sendMsg(msg.chat_id_,msg.id_,"𖤐 عذرا , عزيزي المطور \n𖤐 هذا ليس معرف قناة , حاول مجددا .")
return false
end
end

if redis:get(mark..'namebot:witting'..msg.sender_user_id_) then --- استقبال اسم البوت 
redis:del(mark..'namebot:witting'..msg.sender_user_id_)
redis:set(mark..':NameBot:',msg.text)
Start_Bot() 
sendMsg(msg.chat_id_,msg.id_,"𖤐 تم تغير اسم البوت  .\n𖤐 الان اسمه "..Flter_Markdown(msg.text).." \n")
return false
end

if redis:get(mark..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد لكل المجموعات
if not redis:get(mark..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال كلمه الرد لكل المجموعات
redis:hdel(mark..'replay_photo:group:',msg.text)
redis:hdel(mark..'replay_voice:group:',msg.text)
redis:hdel(mark..'replay_animation:group:',msg.text)
redis:hdel(mark..'replay_audio:group:',msg.text)
redis:hdel(mark..'replay_sticker:group:',msg.text)
redis:hdel(mark..'replay_video:group:',msg.text)
redis:setex(mark..'allreplay:'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"𖤐 جيد , يمكنك الان ارسال جوا ب الردالعام \n𖤐 [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]]\n")
end
end

if redis:get(mark..'delrdall:'..msg.sender_user_id_) then
redis:del(mark..'delrdall:'..msg.sender_user_id_)
local names = redis:hget(mark..'replay:all',msg.text)
local photo =redis:hget(mark..'replay_photo:group:',msg.text)
local voice = redis:hget(mark..'replay_voice:group:',msg.text)
local animation = redis:hget(mark..'replay_animation:group:',msg.text)
local audio = redis:hget(mark..'replay_audio:group:',msg.text)
local sticker = redis:hget(mark..'replay_sticker:group:',msg.text)
local video = redis:hget(mark..'replay_video:group:',msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 **هذا الرد ليس مضاف في قائمه الردود .')
else
redis:hdel(mark..'replay:all',msg.text)
redis:hdel(mark..'replay_photo:group:',msg.text)
redis:hdel(mark..'replay_voice:group:',msg.text)
redis:hdel(mark..'replay_audio:group:',msg.text)
redis:hdel(mark..'replay_animation:group:',msg.text)
redis:hdel(mark..'replay_sticker:group:',msg.text)
redis:hdel(mark..'replay_video:group:',msg.text)
return sendMsg(msg.chat_id_,msg.id_,'('..Flter_Markdown(msg.text)..')\n𖤐 تم مسح الرد . ')
end 
end 


if redis:get(mark..'text_sudo:witting'..msg.sender_user_id_) then -- استقبال كليشه المطور
redis:del(mark..'text_sudo:witting'..msg.sender_user_id_) 
redis:set(mark..':TEXT_SUDO',Flter_Markdown(msg.text))
return sendMsg(msg.chat_id_,msg.id_, "𖤐 ** تم وضع الكليشه بنجاح كلاتي .\n\n*{*  "..Flter_Markdown(msg.text).."  *}*\n")
end
if redis:get(mark..'welcom:witting'..msg.sender_user_id_) then -- استقبال كليشه الترحيب
redis:del(mark..'welcom:witting'..msg.sender_user_id_) 
redis:set(mark..'welcome:msg'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"𖤐 ** تم وضع الترحيب بنجاح كلاتي .\n" )
end
if redis:get(mark..'rulse:witting'..msg.sender_user_id_) then --- استقبال القوانين
redis:del(mark..'rulse:witting'..msg.sender_user_id_) 
redis:set(mark..'rulse:msg'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** مرحبآ عزيزي\n𖤐 تم حفظ القوانين بنجاح .\n𖤐 ارسل [[ القوانين ]] لعرضها \n')
end
if redis:get(mark..'name:witting'..msg.sender_user_id_) then --- استقبال الاسم
redis:del(mark..'name:witting'..msg.sender_user_id_) 
tdcli_function({ID= "ChangeChatTitle",chat_id_=msg.chat_id_,title_=msg.text},dl_cb,nil)
end
if redis:get(mark..'linkGroup'..msg.sender_user_id_,link) then --- استقبال الرابط
redis:del(mark..'linkGroup'..msg.sender_user_id_,link) 
redis:set(mark..'linkGroup'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'𖤐 تم وضع الرابط الجديد بنجاح .. 🍂')
end
if redis:get(mark..'about:witting'..msg.sender_user_id_) then --- استقبال الوصف
redis:del(mark..'about:witting'..msg.sender_user_id_) 
tdcli_function({ID="ChangeChannelAbout",channel_id_=msg.chat_id_:gsub('-100',''),about_ = msg.text},function(arg,data) 
if data.ID == "Ok" then 
return sendMsg(msg.chat_id_,msg.id_,"𖤐 ** تم وضع الوصف بنجاح\n")
end 
end,nil)
end


if redis:get(mark..'fwd:all'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه عام
redis:del(mark..'fwd:all'..msg.sender_user_id_)
local pv = redis:smembers(mark..'users')  
local groups = redis:smembers(mark..'group:ids')
local allgp =  #pv + #groups
if allgp >= 300 then
sendMsg(msg.chat_id_,msg.id_,'𖤐 اهلا عزيزي المطور \n𖤐 جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
for i = 1, #pv do 
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem user From list")
redis:srem(mark..'users',pv[i])
end
end)
end
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
rem_data_group(groups[i])
end
end)
end
return sendMsg(msg.chat_id_,msg.id_,'𖤐 **تم اذاعه الكليشه بنجاح .\n𖤐 **للمجموعات » ( *'..#groups..'* )\n𖤐 ** للمشتركين » ( '..#pv..' )\n')
end

if redis:get(mark..'fwd:pv'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(mark..'fwd:pv'..msg.sender_user_id_)
local pv = redis:smembers(mark..'users')
if #pv >= 300 then
sendMsg(msg.chat_id_,msg.id_,'𖤐 اهلا عزيزي المطور \n𖤐 جاري نشر الرساله للمشتركين ...')			
end
local NumPvDel = 0
for i = 1, #pv do
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
redis:srem(mark..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'𖤐 **عدد المشتركين : ❴ '..#pv..' ❵\n𖤐 **تم الاذاعه الى ❴ '..SenderOk..'  ❵ مشترك \n') 
end
end)
end
end

if redis:get(mark..'fwd:groups'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(mark..'fwd:groups'..msg.sender_user_id_)
local groups = redis:smembers(mark..'group:ids')
if #groups >= 300 then
sendMsg(msg.chat_id_,msg.id_,'𖤐 اهلا عزيزي المطور \n𖤐 جاري نشر الرساله للمجموعات ...')			
end
local NumGroupsDel = 0
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok") 
else
print("Rem Group From list")
rem_data_group(groups[i])
NumGroupsDel = NumGroupsDel + 1
end
if #groups == i then
local AllGroupSend = #groups - NumGroupsDel
if NumGroupsDel ~= 0 then
MsgTDel = '𖤐 **تم حذف ❴ *'..NumGroupsDel..'* ❵ من قائمه الاذاعه لانهم قامو بطرد البوت من المجموعه'
else
MsgTDel = ''
end
sendMsg(msg.chat_id_,msg.id_,'𖤐 **عدد المجموعات ❴ *'..#groups..'* ❵\n𖤐 **تـم الاذاعه الى ❴ *'..AllGroupSend..'* ❵\n'..MsgTDel..'')
end
end)
end
end 
end 

if msg.adduser and msg.adduser == our_id and redis:get(mark..':WELCOME_BOT') then
sendPhoto(msg.chat_id_,msg.id_,redis:get(mark..':WELCOME_BOT'),[[𖤐أهلاً انا بوت ]]..redis:get(mark..':NameBot:')..[[
𖤐 أختصاصي حماية‌‏ المجموعات
𖤐 مـن السبام والتوجيه‌‏ والتكرار والخ...

𖤐 مـعـرف الـمـطـور  : ]]..SUDO_USER:gsub([[\_]],'_')..[[
]])
return false
end 

if msg.forward_info and redis:get(mark..'fwd:'..msg.sender_user_id_) then
redis:del(mark..'fwd:'..msg.sender_user_id_)
local pv = redis:smembers(mark..'users')
local groups = redis:smembers(mark..'group:ids')
local allgp =  #pv + #groups
if allgp == 500 then
sendMsg(msg.chat_id_,msg.id_,'𖤐 اهلا عزيزي المطور \n𖤐 جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
local number = 0
for i = 1, #pv do 
fwdMsg(pv[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
for i = 1, #groups do 
fwdMsg(groups[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
return sendMsg(msg.chat_id_,msg.id_,'𖤐 **تم اذاعه التوجيه بنجاح .\n𖤐 **للمجموعات » ❴ *'..#groups..'* ❵\n𖤐 **للخاص » ❴ '..#pv..' ❵\n')			
end

if msg.content_.ID == "MessagePhoto" and redis:get(mark..'welcom_ph:witting'..msg.sender_user_id_) then
redis:del(mark..'welcom_ph:witting'..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:set(mark..':WELCOME_BOT',photo_id)
return sendMsg(msg.chat_id_,msg.id_,'𖤐 تم تغيير صوره‏‏ الترحيب للبوت .\n')
end 

if msg.content_.ID == "MessagePhoto" and msg.type == "channel" and msg.GroupActive then
if redis:get(mark..'photo:group'..msg.chat_id_..msg.sender_user_id_) then
redis:del(mark..'photo:group'..msg.chat_id_..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_=msg.chat_id_,photo_=GetInputFile(photo_id)},function(arg,data)
if data.code_ == 3 then
sendMsg(arg.chat_id_,arg.id_,'𖤐 ليس لدي صلاحيه تغيير الصوره \n𖤐 يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀\n')
end
end,{chat_id_=msg.chat_id_,id_=msg.id_})
return false
end
end

if not msg.GroupActive then return false end
if msg.text then

if redis:get(mark..'addrd:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد للمجموعه فقط

if not redis:get(mark..'replay1'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
redis:hdel(mark..'replay:'..msg.chat_id_,msg.text)
redis:hdel(mark..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(mark..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(mark..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(mark..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(mark..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(mark..'replay_video:group:'..msg.chat_id_,msg.text)
redis:setex(mark..'replay1'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"𖤐 جيد , يمكنك الان ارسال جواب الرد \n𖤐 [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]]\n")
end
end

if redis:get(mark..'delrd:'..msg.sender_user_id_) then
redis:del(mark..'delrd:'..msg.sender_user_id_)
local names 	= redis:hget(mark..'replay:'..msg.chat_id_,msg.text)
local photo 	= redis:hget(mark..'replay_photo:group:'..msg.chat_id_,msg.text)
local voice 	= redis:hget(mark..'replay_voice:group:'..msg.chat_id_,msg.text)
local animation = redis:hget(mark..'replay_animation:group:'..msg.chat_id_,msg.text)
local audio 	= redis:hget(mark..'replay_audio:group:'..msg.chat_id_,msg.text)
local sticker 	= redis:hget(mark..'replay_sticker:group:'..msg.chat_id_,msg.text)
local video 	= redis:hget(mark..'replay_video:group:'..msg.chat_id_,msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 **هذا الرد ليس مضاف في قائمه الردود .')
else
redis:hdel(mark..'replay:'..msg.chat_id_,msg.text)
redis:hdel(mark..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(mark..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(mark..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(mark..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(mark..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(mark..'replay_video:group:'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'(['..msg.text..'])\n𖤐 تم مسح الرد . ')
end 
end

end

if msg.pinned then
print(" -- pinned -- ")
local msg_pin_id = redis:get(mark..":MsgIDPin:"..msg.chat_id_)
if not msg.Director and redis:get(mark..'lock_pin'..msg.chat_id_) then
if msg_pin_id then
print(" -- pinChannelMessage -- ")
tdcli_function({ID ="PinChannelMessage",
channel_id_ = msg.chat_id_:gsub('-100',''),
message_id_ = msg_pin_id,
disable_notification_ = 0},
function(arg,data)
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"𖤐 ** ًعذرا التثبيت مقفل من قبل الاداره تم ارجاع التثبيت القديم\n")
end
end,nil)
else
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"𖤐 ** ًعذرا التثبيت مقفل من قبل الاداره تم الغاء التثبيت\n")      
end
end,nil)
end
return false
end
redis:set(mark..":MsgIDPin:"..msg.chat_id_,msg.id_)
end

if msg.content_.ID == "MessageChatChangePhoto" then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end
return sendMsg(msg.chat_id_,msg.id_," قام ["..UserName.."] بتغير صوره المجموعه .\n")
end)
end

if msg.content_.ID == "MessageChatChangeTitle" then
GetUserID(msg.sender_user_id_,function(arg,data)
redis:set(mark..'group:name'..msg.chat_id_,msg.content_.title_)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end

return sendMsg(msg.chat_id_,msg.id_,"𖤐 قام  ["..UserName.."]\n𖤐 بتغير اسم المجموعه .\n𖤐 الى "..Flter_Markdown(msg.content_.title_).." \n") 
end)
end
if msg.adduser or msg.joinuser then
if redis:get(mark..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
else
if redis:get(mark..'welcome:get'..msg.chat_id_) then 
if not msg.adduserType then
GetUserID(msg.sender_user_id_,function(arg,data)  
welcome = (redis:get(mark..'welcome:msg'..msg.chat_id_) or "𖤐 اهلاً عزيزي {الاسم}\n𖤐 معرفك » {المعرف}\n{القوانين}\n\nالرجاء الالتزام بالقوانين\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n𖤐 اسم القروب » {المجموعه}")
if welcome then
rules = (redis:get(mark..'rulse:msg'..msg.chat_id_) or "𖤐 مرحباً عزيري القوانين كلاتي .\n𖤐 ممنوع نشر الروابط\n𖤐 ممنوع التكلم او نشر صور اباحيه\n𖤐 ممنوع  اعاده توجيه\n𖤐 ممنوع التكلم بالسياسة\n𖤐 الرجاء احترام المدراء والادمنيه .\n")
welcome = welcome:gsub("{القوانين}", rules)
if data.username_ then UserName = '@'..data.username_ else UserName = '< لا يوجد معرف >' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(mark..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(data.first_name_..' '..(data.last_name_ or "" ),20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end)
else
welcome = (redis:get(mark..'welcome:msg'..msg.chat_id_) or "𖤐 اهلن بك عزيزي {الاسم}\n𖤐 معرفك » {المعرف}\n{القوانين}\n\nالرجاء الالتزام بالقوانين\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n𖤐 اسم القروب » {المجموعه}")
if welcome then
rules = (redis:get(mark..'rulse:msg'..msg.chat_id_) or "𖤐 مرحباً عزيري القوانين كلاتي .\n𖤐 ممنوع نشر الروابط\n𖤐 ممنوع التكلم او نشر صور اباحيه\n𖤐 ممنوع  اعاده توجيه\n𖤐 ممنوع التكلم بالسياسة\n𖤐 الرجاء احترام المدراء والادمنيه\n")
welcome = welcome:gsub("{القوانين}", rules)
if msg.addusername then UserName = '@'..msg.addusername else UserName = '< لا يوجد معرف >' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(mark..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(msg.addname,20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end

end
end
end 

--------------------------------------------
if msg.adduser and redis:get(mark..'welcome:get'..msg.chat_id_) then
local adduserx = tonumber(redis:get(mark..'user:'..msg.sender_user_id_..':msgs') or 0)
if adduserx > 3 then 
redis:del(mark..'welcome:get'..msg.chat_id_)
end
redis:setex(mark..'user:'..msg.sender_user_id_..':msgs',3,adduserx+1)
end

if not msg.Admin and not msg.Special and not (msg.adduser or msg.joinuser or msg.deluser ) then -- للاعضاء فقط   

if not msg.forward_info and redis:get(mark..'lock_flood'..msg.chat_id_)  then
local msgs = (redis:get(mark..'user:'..msg.sender_user_id_..':msgs') or 0)
local NUM_MSG_mark = (redis:get(mark..'num_msg_mark'..msg.chat_id_) or 5)
if tonumber(msgs) > tonumber(NUM_MSG_mark) then 
GetUserID(msg.sender_user_id_,function(arg,datau)
Restrict(msg.chat_id_,msg.sender_user_id_,1)
redis:setex(mark..'sender:'..msg.sender_user_id_..':flood',30,true)
if datau.username_ then USERNAME = '@'..datau.username_ else USERNAME = FlterName(datau.first_name_..' '..(datau.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,datau.id_,msg.id_,"𖤐 العضو » "..USERNAME.."\n𖤐 قمـت بتكرار اكثر مـن "..NUM_MSG_mark.." رسالة‌‏ , لذا تم تقييدك مـن المجموعه‌\n",12,USERCAR) 
return false
end)
end 
redis:setex(mark..'user:'..msg.sender_user_id_..':msgs',2,msgs+1)
end
 
 function Get_Info(msg,chat,user) --// ارسال نتيجة الصلاحيه
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 صلاحياته منشئ القروب\n')   
end 
if Json_Info.result.status == "member" then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 مجرد عضو هنا\n')   
end 
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end
return sendMsg(chat,msg.id_,'𖤐 الرتبة : مشرف\n𖤐 والصلاحيات هي ↓ \nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n𖤐 تغير معلومات المجموعه ↞ ❪ '..info..' ❫\n𖤐 حذف الرسائل ↞ ❪ '..delete..' ❫\n𖤐 حظر المستخدمين ↞ ❪ '..restrict..' ❫\n𖤐 دعوة مستخدمين ↞ ❪ '..invite..' ❫\n𖤐 تثبيت الرسائل ↞ ❪ '..pin..' ❫\n𖤐 اضافة مشرفين جدد ↞ ❪ '..promote..' ❫\n\n𖤐 ملاحضه » علامة ❪  ꪜ ❫ تعني لديه الصلاحية وعلامة ❪ ✘ ❫ تعني ليس ليديه الصلاحيه')   
end
end
end

if msg.forward_info_ then
if redis:get(mark..'mute_forward'..msg.chat_id_) then -- قفل التوجيه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd \27[0m")

if data.ID == "Error" and data.code_ == 6 then 
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) and not redis:get(mark..':User_Fwd_Msg:'..msg.sender_user_id_..':flood') then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 عذراً ممنوع اعادة التوجيه  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) 
return redis:setex(mark..':User_Fwd_Msg:'..msg.sender_user_id_..':flood',15,true)
end,nil)
end
end)
return false
elseif redis:get(mark..':tqeed_fwd:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd tqeed \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false 
end
elseif tonumber(msg.via_bot_user_id_) ~= 0 and redis:get(mark..'mute_inline'..msg.chat_id_) then -- قفل الانلاين
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send inline \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 عذراً الانلاين مقفول  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text then -- رسايل فقط
if utf8.len(msg.text) > 500 and redis:get(mark..'lock_spam'..msg.chat_id_) then -- قفل الكليشه 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send long msg \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 ممنوع ارسال الكليشه والا سوف تجبرني على طردك  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") 
or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.text:match(".[Pp][Ee]") 
or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.text:match("[Hh][Tt][Tt][Pp]://") 
or msg.text:match("[Ww][Ww][Ww].") 
or msg.text:match(".[Cc][Oo][Mm]")) 
and redis:get(mark..':tqeed_link:'..msg.chat_id_)  then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user i restricted becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false
elseif(msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Oo][Rr][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match(".[Pp][Ee]")) 
and redis:get(mark..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 ممنوع ارسال الروابط  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]") or msg.text:match(".[Tt][Kk]") or msg.text:match(".[Mm][Ll]") or msg.text:match(".[Oo][Rr][Gg]")) and redis:get(mark..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 ممنوع ارسال روابط الويب   \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("#[%a%d_]+") and redis:get(mark..'lock_tag'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send tag \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 ممنوع ارسال التاك  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("@[%a%d_]+")  and redis:get(mark..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 ممنوع ارسال المعرف   \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) 
end,nil)
end
end)
return false
elseif not msg.textEntityTypeBold and (msg.textEntityTypeBold or msg.textEntityTypeItalic) and redis:get(mark..'lock_markdown'..msg.chat_id_) then 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send markdown \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 ممنوع ارسال الماركدوان  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.textEntityTypeTextUrl and redis:get(mark..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web page \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 ممنوع ارسال روابط الويب   \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
 
elseif msg.edited and redis:get(mark..'lock_edit'..msg.chat_id_) then -- قفل التعديل
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Edit \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 عذراً ممنوع التعديل تم المسح \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end 
elseif msg.content_.ID == "MessageUnsupported" and redis:get(mark..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 عذرا ممنوع ارسال الفيديو كام \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.photo then
if redis:get(mark..'mute_photo'..msg.chat_id_)  then -- قفل الصور
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 عذرا ممنوع ارسال الصور  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif redis:get(mark..':tqeed_photo:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user resctricted becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.video then
if redis:get(mark..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send vedio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 عذرا ممنوع ارسال الفيديو  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(mark..':tqeed_video:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.document and redis:get(mark..'mute_document'..msg.chat_id_) then -- قفل الملفات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send file \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
 if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 عذرا ممنوع ارسال الملفات  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.sticker and redis:get(mark..'mute_sticker'..msg.chat_id_) then --قفل الملصقات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send sticker \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 عذرا ممنوع ارسال الملصقات  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.animation then
if redis:get(mark..'mute_gif'..msg.chat_id_) then -- قفل المتحركه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 عذرا ممنوع ارسال الصور المتحركه  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(mark..':tqeed_gif:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.contact and redis:get(mark..'mute_contact'..msg.chat_id_) then -- قفل الجهات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Contact \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
 if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 عذرا ممنوع ارسال جهات الاتصال  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.location and redis:get(mark..'mute_location'..msg.chat_id_) then -- قفل الموقع
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send location \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
 if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 عذرا ممنوع ارسال الموقع  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.voice and redis:get(mark..'mute_voice'..msg.chat_id_) then -- قفل البصمات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send voice \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
 if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 عذرا ممنوع ارسال البصمات  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.game and redis:get(mark..'mute_game'..msg.chat_id_) then -- قفل الالعاب
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send game \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 عذرا ممنوع لعب الالعاب  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.audio and redis:get(mark..'mute_audio'..msg.chat_id_) then -- قفل الصوت
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send audio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 عذرا ممنوع ارسال الصوت  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.replyMarkupInlineKeyboard and redis:get(mark..'mute_keyboard'..msg.chat_id_) then -- كيبورد
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send keyboard \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 عذرا الكيبورد مقفول  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end

if msg.content_ and msg.content_.caption_ then -- الرسايل الي بالكابشن
print("sdfsd     f- ---------- ")
if (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.content_.caption_:match("[Tt].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match(".[Pp][Ee]")) 
and redis:get(mark..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 عذرا ممنوع ارسال الروابط  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") 
or msg.content_.caption_:match("[Ww][Ww][Ww].") 
or msg.content_.caption_:match(".[Cc][Oo][Mm]")) 
and redis:get(mark..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send webpage caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "𖤐 عذرا ممنوع ارسال روابط الويب  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.content_.caption_:match("@[%a%d_]+") and redis:get(mark..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'𖤐 ** لا يمكنني مسح الرساله المخالفه .\n𖤐 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(mark..'lock_woring'..msg.chat_id_) then
local msgx = "𖤐 عذرا ممنوع ارسال التاك او المعرف  \n"
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"𖤐 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end 
end)
return false
end 

end --========{ End if } ======

end 
SaveNumMsg(msg)
------------------------------{ Start Replay Send }------------------------

if msg.text and redis:get(mark..'replay'..msg.chat_id_) then

local Replay = false

 Replay = redis:hget(mark..'replay:all',msg.text)
if Replay then
sendMsg(msg.chat_id_,msg.id_,Replay)
return false
end

 Replay = redis:hget(mark..'replay:'..msg.chat_id_,msg.text)
if Replay then 
 sendMsg(msg.chat_id_,msg.id_,Replay) 
return false
end
 Replay = redis:hget(mark..'replay_photo:group:',msg.text)
if Replay then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(mark..'replay_voice:group:',msg.text)
if Replay then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(mark..'replay_animation:group:',msg.text)
if Replay then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(mark..'replay_audio:group:',msg.text)
if Replay then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(mark..'replay_sticker:group:',msg.text)
if Replay then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(mark..'replay_video:group:',msg.text)
if Replay then 
print("0000000000000") 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(mark..'replay_photo:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(mark..'replay_voice:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(mark..'replay_animation:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(mark..'replay_audio:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(mark..'replay_sticker:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(mark..'replay_video:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end

if not Replay then

--================================{{  Reply Bot  }} ===================================

local nnn = {
"اسمي ["..Bot_Name.."] .",
"تدلل .",
"تفضل .",
"عيوني لك .",
}

local Text = msg.text
local Text2 = Text:match("^"..Bot_Name.." (%d+)$")

if msg.SudoUser and Text == Bot_Name and not Text2 then
return sendMsg(msg.chat_id_,msg.id_,su[math.random(#su)])
elseif not msg.SudoUser and Text== Bot_Name and not Text2 then  
return sendMsg(msg.chat_id_,msg.id_,ss97[math.random(#ss97)])
elseif Text:match("^قول (.*)$") then
if utf8.len(Text:match("^قول (.*)$")) > 500 then 
return sendMsg(msg.chat_id_,msg.id_,"- ما اقدر اقول اكثر من 500 حرف ")
end
local callback_Text = FlterName(Text:match("^قول (.*)$"),50)
if callback_Text and callback_Text ==  ' الاسم سبام ❗️'  then
return sendMsg(msg.chat_id_,msg.id_,"- للاسف النص هذا مخالف ")
else
return sendMsg(msg.chat_id_,0,callback_Text) 
end
elseif not msg.SudoUser and Text==" باي" or Text == "باي" then
return sendMsg(msg.chat_id_,msg.id_,dr[math.random(#dr)])
elseif not msg.SudoUser and Text==" بوت" or Text == "بوت" then
return 
sendMsg(msg.chat_id_,msg.id_,nnn[math.random(#nnn)]) 
elseif Text== "مهدي" or Text== "الاكسلانس" or Text== "المهدي"  then return  sendMsg(msg.chat_id_,msg.id_,"[عم الناس](https://t.me/QpSSpQ)")
elseif Text== "جوكر" or Text== "جوكر" then return  sendMsg(msg.chat_id_,msg.id_,"[عم التيلي يبني](https://t.me/A_j_o_k_e_r)")
elseif Text== "جاك" or Text== "خالد" then return  sendMsg(msg.chat_id_,msg.id_,"[اقمد من القمدان يبرو](https://t.me/V_P_E)")
elseif Text== "سورس مارك" then return  sendMsg(msg.chat_id_,msg.id_,"[افجر سورس مصري  𖠲](https://t.me/RISK_00)")
elseif Text== "رفع غبي"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي\n𖤐 تم رفع الغبي بنجاح↯\n𖤐 تمت إضافته إلى قائمه الأغبياء\n☆")
elseif Text== "تنزيل غبي"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي\n𖤐 تم تنزيل الغبي بنجاح↯\n𖤐 تمت الزاله من قائمه الأغبياء\n☆")
elseif Text== "رفع كلب"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي\n𖤐 تم رفع الكلب بنجاح↯\n𖤐 تمت إضافته إلى قائمه الكلاب\n☆")
elseif Text== "رفع حمار"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي\n𖤐 تم رفع الحمار بنجاح↯\n𖤐 تمت إضافته إلى قائمه الحمير\n☆")
elseif Text== "رفع خول"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ لقـد تم رفع الخول بنجاح\n⸙الان هو خـول \n")
elseif Text== "تنزيل خول"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ تم تنزيل الخول بنجاح \n⸙ الان تم ازلته من قائمه الخولات \n")
elseif Text== "رفع بكس"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ تم رفع الكس بنجاح\n⸙الا⸙الان هو في قائمه المكسكسين \n")
elseif Text== "تنزيل بكس"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ تم تنزيل الكس بنجاح \n⸙الان تم ازلته من قائمه المكسكسين \n")
elseif Text== "رفع متناك"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ تم رفع المتناك بنجاح\n⸙الان هو في قائمه المتناكين \n")
elseif Text== "تنزيل متناك"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ تم تنزيل المتناك بنجاح \n⸙الان تم ازلته من قائمه المتناكين \n")
elseif Text== "رفع عرص"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ تم تنزيل عرص بنجاح\n⸙الان تم ازلته من قائمه معرصين \n")
elseif Text== "تنزيل عرص"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ تم تنزيل عرص بنجاح \n⸙الان تم ازلته من قائمه معرصين \n")
elseif Text== "رفع شرموط"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ تم رفع الشرموط بنجاح\n⸙الان هو في قائمه الشراميط \n")
elseif Text== "تنزيل شرموط"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ تم تنزيل الشرموط بنجاح \n⸙الان تم ازلته من قائمه الشراميط \n")
elseif Text== "رفع شرموط"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ تم رفع الشرموط بنجاح\n⸙الان هو في قائمه الشراميط \n")
elseif Text== "رفع علق"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ تم رفع العلق بنجاح\n⸙الان هو في قائمه العلوق \n")
elseif Text== "تنزيل علق"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ تم تنزيل العلق بنجاح \n⸙الان تم ازلته من قائمه العلوق\n")
elseif Text== "رفع شاذ"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ تم رفع الشاذ بنجاح \n⸙الان هو في قائمه الشواذ\n")
elseif Text== "تنزيل شاذ"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ تم تنزيل شاذ بنجاح \n⸙الان تم ازلته من قائمه الشواذ\n")
elseif Text== "رفع بيست"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ لقد تم رفع بيست بنجاح \n⸙ الان هـ بيست يمكنك اخد مح\n")
elseif Text== "تنزيل بيست"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ لقد تم تنزيل بيست \n⸙ يمكن استرجاع المح الان\n")
elseif Text== "رفع حياتي"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ لقد تم رفع حياتي \n⸙ الان هـ حياتك تفضل خد بوثه\n")
elseif Text== "تنزيل حياتي"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ لقد تم تنزيل من حياتي \n⸙ الان يمكن استرجاع البوثه\n")
elseif Text== "رفع تونز"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ لقد تم رفع تونز بنجاح \n⸙ تفضل في الخاص عشان المراره\n")
elseif Text== "تنزيل تونز"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ لقد تم تنزيل تونز بنجاح \n⸙ الان يمكن عمل بلوك\n")
elseif Text== "رفع سندي"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ لقد تم رفع سندي بنجاح \n⸙ الان هو سندك\n")
elseif Text== "تنزيل سندي"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ لقد تم تنزيل سندي \n⸙ يمكن الان شقط سند اخر\n")
elseif Text== "رفع السندريلا"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ لقد تم رفع سندريلا بنجاح \n⸙ اديلو سندريلا\n")
elseif Text== "تنزيل السندريلا"  then return sendMsg(msg.chat_id_,msg.id_,"⸙ آههلآ  عـزيزي\n⸙ لقد تم رفع سندريلا بنجاح \n⸙ اديلو سندريلا\n")
elseif Text== "تنزيل حمار"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي\n𖤐 تم تنزيل الحمار بنجاح↯\n𖤐 تمت ازالته من قائمه الحمير\n☆")
elseif Text== "تنزيل كلب"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي \n𖤐 تم تنزيل الكلب بنجاح↯\n𖤐 تمت إزالته من قائمه الكلاب\n☆")
elseif Text== "تنزيل متوحده"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي\n𖤐 تم تنزيل المتوحده بنجاح↯\n𖤐 لا متحاولوش حتي لو نزلتوها هتفضل متوحده\n☆")
elseif Text== "رفع متوحده"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي\n𖤐 تم رفع المتوحده بنجاح↯\n𖤐 تمت إضافتها الي قائمة المتوحدين والمتخلفين عقلياً\n☆")
elseif Text== "رفع متوحد"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي\n𖤐 تم رفع المتوحد بنجاح↯\n𖤐 تمت  اضافته الي قائمة المتوحديد والمرضي المفسيين\n☆")
elseif Text== "تنزيل متوحد"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي\n𖤐 تم تنزيل المتوحد بنجاح↯\n𖤐 لا متحاولوش حتي لو نزلتوه هيفضل متوحد\n☆")
elseif Text== "رفع بقلبي"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي\n𖤐 تم رفع العضو داخل قلبك↯\n𖤐 تمت ترقيته بنجاح\n☆")
elseif Text== "تنزيل من قلبي"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي\n𖤐 تم تنزيل من داخل قلبك↯\n𖤐 تمت ازالته من قائمه القلوب\n☆")
elseif Text== "رفع وتكه"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي\n𖤐 تم رفع العضو وتكه بنجاح↯ \n𖤐 اصبحت وتكتك\n☆")
elseif Text== "تنزيل وتكه"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي\n𖤐 تم تنزيل العضو \n𖤐 من قائمة وتكاتك بنجاح\n☆")
elseif Text== "رفع زوجتي"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي\n𖤐 تم رفع العضو زوجتك↯\nالآن يمكنكم أخذ راحتكم واتفضلو اعملو واحد\n☆")
elseif Text== "تنزيل زوجتي"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي\n𖤐 تم تنزيل زوجتك بنجاح↯\nالآن انتم مفترقان طلقتها علشان مبتعرفش صح\n☆")
elseif Text== "زواج"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي\n𖤐 تم زواجكم الاثنين بنجاح↯\n𖤐 الآن هي حلالك بلالك\n☆")
elseif Text== "طلاق"  then return sendMsg(msg.chat_id_,msg.id_,"𖤐 أهلاً عزيزي\n𖤐 تم طلاق الخاينه بنجاح↯\n𖤐 الآن هي مطلقه \n☆")
elseif Text== "اوامر التسليه"  then return sendMsg(msg.chat_id_,msg.id_,"\n‌‌‏┄─┅══┅─┄\n𖤐 مرحباً عزيزي\n𖤐 هذي اوامر التسليه:  \n┄─┅═ـ═┅─┄\n𖤐 رفع ◄► تنزيل ❬ متوحد ❭\n𖤐 رفع ◄► تنزيل ❬ وتكه ❭\n𖤐 رفع ◄► تنزيل ❬ غبي ❭\n𖤐 رفع ◄► تنزيل ❬ كلب ❭\n𖤐 رفع ◄► تنزيل ❬ حمار ❭\n𖤐 رفع ◄► تنزيل ❬ زوجتي ❭\n𖤐 رفع ◄► تنزيل ❬ متوحده ❭\n𖤐 رفع ◄► ❬ بقلبي ❭ تنزيل ◄► ❬ من قلبي❭\n𖤐 ❬ طلاق ❭ ◄► ❬ زواج ❭\n┄─┅═ـ═┅─┄")
elseif Text== "اوامر التسليه الجديده"  then return sendMsg(msg.chat_id_,msg.id_,"\n‌‌‏┄─┅══┅─┄\n⸙ مرحباً عزيزي\n⸙ هذي اوامر التسليه:  \n┄─┅═ـ═┅─┄\nرفع ◄► تنزيل ❬ خول ❭\n⸙رفع ◄► تنزيل ❬ عرص ❭\n⸙رفع ◄► تنزيل ❬ بكس ❭\n⸙رفع ◄► تنزيل ❬ متناك ❭\n⸙رفع ◄► تنزيل ❬ شرموط ❭\n⸙رفع ◄► تنزيل ❬ السندريلا ❭\n⸙رفع ◄► تنزيل ❬ شاذ ❭\n⸙رفع ◄► تنزيل❬ بيست ❭\n⸙رفع ◄► تنزيل❬ تونز ❭\n⸙رفع ◄► تنزيل❬ علق ❭\n⸙رفع ◄► تنزيل❬ حياتي ❭\n⸙رفع ◄► تنزيل❬ سندي ❭\n⸙رفع ◄► تنزيل❬  \n┄─┅═ـ═┅─┄")
elseif Text:match(Bot_Name.."كيفك") then 
  return sendMsg(msg.chat_id_,msg.id_,"بخير يقلبي ونت .")
  elseif Text== "ياتي"  then return sendMsg(msg.chat_id_,msg.id_,"بتكسف يووه.")
  elseif Text== "احبك."  then return sendMsg(msg.chat_id_,msg.id_,"مش اكتر مني ")
  elseif Text== "احبك"  then return sendMsg(msg.chat_id_,msg.id_,"ياتي")
  elseif Text== "يحلو"  then return sendMsg(msg.chat_id_,msg.id_,"اي يقلبي")
  elseif Text== "كسمك"  then return sendMsg(msg.chat_id_,msg.id_,"عيب.")
  elseif Text== "مخنوق"  then  return sendMsg(msg.chat_id_,msg.id_,"اقرء قرأن."  )
  elseif Text== "مرحبا"  then return sendMsg(msg.chat_id_,msg.id_,"اهلاً عزيزي .")
  elseif Text== "سلام" or Text== "السلامم عليكم" or Text== "سلام عليكم" or Text=="سلامنن عليكم" or Text=="السلامن عليكم" then 
  return sendMsg(msg.chat_id_,msg.id_,"وعلـيك السلام يقلبي " )
  elseif Text== "هيه"  then return sendMsg(msg.chat_id_,msg.id_,"وبعدين" )
  elseif Text== "مساعدة"  then return sendMsg(msg.chat_id_,msg.id_,"لعرض قائمة المساعدة اكتب الاوامر 🌚❤️")
  elseif Text== "خول"  then return sendMsg(msg.chat_id_,msg.id_,"شبهك.")
  elseif Text== "حلو"  then return sendMsg(msg.chat_id_,msg.id_,"مش احلي منك")
  elseif Text== "قمر"  then return sendMsg(msg.chat_id_,msg.id_,"انت لقمر يروحي")
  elseif Text== "عاش"  then return sendMsg(msg.chat_id_,msg.id_,"عاشت ايامك")
  elseif Text== "ورده" or Text== "وردة" then return sendMsg(msg.chat_id_,msg.id_,"انت عطرها")
  elseif Text== "اسمك اي"  then return sendMsg(msg.chat_id_,msg.id_,"أعمي انت صح؟")
  elseif Text== "حبيبي" or Text=="حبي" then return  sendMsg(msg.chat_id_,msg.id_,"امـريقلبي")
  elseif Text== "حبيبتي" then return sendMsg(msg.chat_id_,msg.id_,"ف الخـاص مش هنا هنا ")
  elseif Text== "حياتي" then return sendMsg(msg.chat_id_,msg.id_,"اي يروح حياتك")
  elseif Text== "عمري" then return sendMsg(msg.chat_id_,msg.id_,"يحمي عممرك")
  elseif Text== "اسكت" then return sendMsg(msg.chat_id_,msg.id_,"اوك")
  elseif Text== "بتحبني" then return sendMsg(msg.chat_id_,msg.id_,"بعشـقك")
  elseif Text== "اقول" or Text=="اقولك" or Text=="اقولك." then return sendMsg(msg.chat_id_,msg.id_,"قول بحب الفضايح")
  elseif Text== "موجود" then return sendMsg(msg.chat_id_,msg.id_,"امـريعيني")
  elseif Text== "اكلك" then return sendMsg(msg.chat_id_,msg.id_,"هممم يجمل")

  elseif Text== "ايديي" or Text=="ايدي 🆔" then 
  GetUserID(msg.sender_user_id_,function(arg,data)
  if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
  local USERCAR = utf8.len(USERNAME)
  SendMention(msg.chat_id_,data.id_,msg.id_,"\n\n _ 𝚄𝚂𝙴𝚁 𖣼 "..USERNAME..".   _ 𝚈𝙾𝚄𝚁 𝙸𝙳 𖢇 "..data.id_.." ",37,USERCAR)  
  return false
  end)
  elseif Text=="ابي رابط الحذف" or Text=="ابي رابط حذف" or Text=="رابط حذف" or Text=="رابط الحذف" then
  return sendMsg(msg.chat_id_,msg.id_,[[
  𖤐 رابط حذف حساب التليجرام
𖤐 [أضغط هُنا](https://telegram.org/deactivate) - .
‏
  ]] )
  --=====================================
elseif Text== "انا مين" or Text== "مين انا"  then
if msg.SudoUser then  
return sendMsg(msg.chat_id_,msg.id_,"[انت مطوري الغالي ♕](https://t.me/RISK_00) ")
elseif msg.Creator then 
return sendMsg(msg.chat_id_,msg.id_,"[انت منشئ المجموعه  تاج راسي♔](https://t.me/RISK_00)")
elseif msg.Director then 
return sendMsg(msg.chat_id_,msg.id_,"[انت مدير المجموعه๑](https://t.me/RISK_00)")
elseif msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,"[انت ادمن شد حيلك♘](https://t.me/RISK_00)")
else 
return sendMsg(msg.chat_id_,msg.id_,"[مجرد عضو هنا 𖦹](https://t.me/RISK_00)")
end 
end 
elseif Text== "مين ضافني" or Text== "منو ضافني"  then
if msg.SudoUser then  
return sendMsg(msg.chat_id_,msg.id_,"[انت مكانك كل مكان يا مطور♕](https://t.me/RISK_00) ")
elseif msg.Creator then 
return sendMsg(msg.chat_id_,msg.id_,"[انت منشئ المجموعه](https://t.me/RISK_00)")
elseif msg.Director then 
return sendMsg(msg.chat_id_,msg.id_,"[انت دخلت عبر الرابط](https://t.me/RISK_00)")
elseif msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,"[انت دخلت عبر الرابط](https://t.me/RISK_00)")
else 
return sendMsg(msg.chat_id_,msg.id_,"[انت دخلت عبر الرابط](https://t.me/RISK_00)")
end



end 


end


------------------------------{ End Replay Send }------------------------

------------------------------{ Start Checking CheckExpire }------------------------
if not redis:get('kar') then
  redis:setex('kar',86400,true) 
  json_data = '{"BotID": '..mark..',"UserBot": "'..Bot_User..'","Groups" : {'
  local All_Groups_ID = redis:smembers(mark..'group:ids')
  for key,GroupS in pairs(All_Groups_ID) do
  local NameGroup = (redis:get(mark..'group:name'..GroupS) or '')
  NameGroup = NameGroup:gsub('"','')
  NameGroup = NameGroup:gsub([[\]],'')
  if key == 1 then
  json_data =  json_data ..'"'..GroupS..'":{"Title":"'..NameGroup..'"'
  else
  json_data =  json_data..',"'..GroupS..'":{"Title":"'..NameGroup..'"'
  end
  local admins = redis:smembers(mark..'admins:'..GroupS)
  if #admins ~= 0 then
  json_data =  json_data..',"Admins" : {'
  for key,value in pairs(admins) do
  local info = redis:hgetall(mark..'username:'..value)
  if info then 
  UserName_ = (info.username or "")
  UserName_ = UserName_:gsub([[\]],'')
  UserName_ = UserName_:gsub('"','')
  end 
  if key == 1 then
  json_data =  json_data..'"'..UserName_..'":'..value
  else
  json_data =  json_data..',"'..UserName_..'":'..value
  end
  end
  json_data =  json_data..'}'
  end
  
  local creators = redis:smembers(mark..':MONSHA_BOT:'..GroupS)
  if #creators ~= 0 then
  json_data =  json_data..',"Creator" : {'
  for key,value in pairs(creators) do
  local info = redis:hgetall(mark..'username:'..value)
  if info then 
  UserName_ = (info.username or "")
  UserName_ = UserName_:gsub([[\]],'')
  UserName_ = UserName_:gsub('"','')
  end 
  if key == 1 then
  json_data =  json_data..'"'..UserName_..'":'..value
  else
  json_data =  json_data..',"'..UserName_..'":'..value
  end 
  end
  json_data =  json_data..'}'
  end
  local creator = redis:smembers(mark..':KARA_BOT:'..GroupS)
  if #creator ~= 0 then
  json_data =  json_data..',"Kara" : {'
  for key,value in pairs(creator) do
  local info = redis:hgetall(mark..'username:'..value)
  if info then 
  UserName_ = (info.username or "")
  UserName_ = UserName_:gsub([[\]],'')
  UserName_ = UserName_:gsub('"','')
  end 
  if key == 1 then
  json_data =  json_data..'"'..UserName_..'":'..value
  else
  json_data =  json_data..',"'..UserName_..'":'..value
  end 
  end
  json_data =  json_data..'}'
  end
  
  local owner = redis:smembers(mark..'owners:'..GroupS)
  if #owner ~= 0 then
  json_data =  json_data..',"Owner" : {'
  for key,value in pairs(owner) do
  local info = redis:hgetall(mark..'username:'..value)
  if info then 
  UserName_ = (info.username or "")
  UserName_ = UserName_:gsub([[\]],'')
  UserName_ = UserName_:gsub('"','')
  end 
  if key == 1 then
  json_data =  json_data..'"'..UserName_..'":'..value
  else
  json_data =  json_data..',"'..UserName_..'":'..value
  end
  end
  json_data =  json_data..'}'
  end
  json_data =  json_data.."}"
  end
  local Save_Data = io.open("./inc/"..Bot_User..".json","w+")
  Save_Data:write(json_data..'}}')
  Save_Data:close()
  sendDocument(SUDO_ID,0,"./inc/"..Bot_User..".json","𖤐 ملف نسخه تلقائيه\n𖤐   اليك مجموعاتك » { "..#All_Groups_ID.." }\n𖤐 للبوت » "..Bot_User.."\n𖤐 التاريخ » "..os.date("%Y/%m/%d").."\n",dl_cb,nil)
  end
  if redis:get(mark..'CheckExpire::'..msg.chat_id_) then
  local ExpireDate = redis:ttl(mark..'ExpireDate:'..msg.chat_id_)
  if not ExpireDate and not msg.SudoUser then
  rem_data_group(msg.chat_id_)
  sendMsg(SUDO_ID,0,'𖤐 انتهى الاشتراك في احد المجموعات .\n𖤐 المجموعه : '..FlterName(redis:get(mark..'group:name'..msg.chat_id_))..'.\n𖤐 ايدي : '..msg.chat_id_)
  sendMsg(msg.chat_id_,0,'𖤐 انتهى الاشتراك البوت.\n𖤐 سوف اغادر المجموعه فرصه سعيده .\n𖤐 او راسل المطور للتجديد '..SUDO_USER..' 🍃')
  return StatusLeft(msg.chat_id_,our_id)
  else
  local DaysEx = (redis:ttl(mark..'ExpireDate:'..msg.chat_id_) / 86400)
  if tonumber(DaysEx) > 0.208 and ExpireDate ~= -1 and msg.Admin then
  if tonumber(DaysEx + 1) == 1 and not msg.SudoUser then
  sendMsg(msg.chat_id_,'𖤐 باقي يوم واحد وينتهي الاشتراك .\n𖤐 راسل المطور للتجديد '..SUDO_USER..'\n')
  end 
  end 
  end
  end
  
  ------------------------------{ End Checking CheckExpire }------------------------
  
  
  end 
  
  
  return {
  mark = {
  "^(تقييد)$",
  "^(تقييد) (%d+)$",
  "^(تقييد) (@[%a%d_]+)$",
  "^(فك التقييد)$",
  "^(فك التقييد) (%d+)$",
  "^(فك التقييد) (@[%a%d_]+)$",
  "^(فك تقييد)$",
  "^(فك تقييد) (%d+)$",
  "^(فك تقييد) (@[%a%d_]+)$",
  "^(ضع شرط التفعيل) (%d+)$",
  "^(التفاعل)$",
  "^(التفاعل) (@[%a%d_]+)$",
  "^([iI][dD])$",
  "^(تفعيل الايدي بالصوره)$",
  "^(تعطيل الايدي بالصوره)$",
  "^(تعطيل الرفع)$",
  "^(تفعيل الرفع)$",
  "^(قفل الدخول بالرابط)$",
  "^(فتح الدخول بالرابط)$", 
  "^(ايدي)$",
  "^(ايدي) (@[%a%d_]+)$",
  "^(★  أّلَمًبًرمًجّ أّلَأّسِـأّسِـى ★)$",
  "^(★  وٌأّتٌـسِـأّبً أّلَمًبًرمًجّ أّلَأّسِـأّسِـى ★)$",
  "^(★ ^ ★)$",
  "^(المبرمج الجوكر)$",
  "^(مهدي المالك)$",
  "^(مصنع بوتات المبرمج)$",
  "^(بوت ماركت المبرمج)$",
  "^(بوت دعم قنوات المبرمج)$",
  "^(كشف)$",
  "^(كشف) (%d+)$",
  "^(كشف) (@[%a%d_]+)$",
  '^(رفع مميز)$',
  '^(رفع مميز) (@[%a%d_]+)$',
  '^(رفع مميز) (%d+)$',
  '^(تنزيل مميز)$',
  '^(تنزيل مميز) (@[%a%d_]+)$',
  '^(تنزيل مميز) (%d+)$',
  '^(رفع ادمن)$',
  '^(رفع ادمن) (@[%a%d_]+)$',
  '^(رفع ادمن) (%d+)$',
  '^(تنزيل ادمن)$',
  '^(تنزيل ادمن) (@[%a%d_]+)$',
  '^(تنزيل ادمن) (%d+)$', 
  '^(رفع مطي)$',
  '^(تنزيل مطي)$', 
  '^(رفع متوحده)$',
  '^(تنزيل متوحده)$', 
  '^(رفع المدير)$',
  '^(رفع مدير)$', 
  '^(رفع مدير) (@[%a%d_]+)$',
  '^(رفع المدير) (@[%a%d_]+)$',
  '^(رفع المدير) (%d+)$',
  '^(رفع مدير) (%d+)$',
  '^(رفع منشى اساسي)$',
  '^(رفع منشئ اساسي)$',
  '^(رفع منشئ اساسي) (@[%a%d_]+)$',
  '^(رفع منشى اساسي) (@[%a%d_]+)$',
  '^(تنزيل منشئ اساسي)$',
  '^(تنزيل منشى اساسي)$',
  '^(تنزيل منشئ اساسي) (%d+)$',
  '^(تنزيل منشى اساسي) (%d+)$',
  '^(تنزيل منشى اساسي) (@[%a%d_]+)$',
  '^(تنزيل منشئ اساسي) (@[%a%d_]+)$',
  '^(رفع منشى)$',
  '^(رفع منشئ)$',
  '^(رفع منشئ) (@[%a%d_]+)$',
  '^(رفع منشى) (@[%a%d_]+)$',
  '^(تنزيل منشئ)$',
  '^(تنزيل منشى)$',
  '^(تنزيل منشئ) (%d+)$',
  '^(تنزيل منشى) (%d+)$',
  '^(تنزيل منشى) (@[%a%d_]+)$',
  '^(تنزيل منشئ) (@[%a%d_]+)$',
  '^(تنزيل المدير)$',
  '^(تنزيل مدير)$',
  '^(تنزيل مدير) (@[%a%d_]+)$',
  '^(تنزيل المدير) (@[%a%d_]+)$',
  '^(تنزيل المدير) (%d+)$',
  '^(تنزيل مدير) (%d+)$',
   '^(صلاحياته)$',
   '^(صلاحياتي)$',
  '^(صلاحياته) (@[%a%d_]+)$',
  '^(قفل) (.+)$',
  '^(فتح) (.+)$',
  '^(تفعيل)$',
  '^(تفعيل) (.+)$',
  '^(تعطيل)$',
  '^(تعطيل) (.+)$',
  '^(ضع تكرار) (%d+)$',
  "^(مسح)$",
  "^(مسح) (.+)$",
  '^(منع) (.+)$',
  '^(الغاء منع) (.+)$',
  "^(حظر عام)$",
  "^(حظر عام) (@[%a%d_]+)$",
  "^(حظر عام) (%d+)$",
  "^(الغاء العام)$",
  "^(الغاء العام) (@[%a%d_]+)$",
  "^(الغاء العام) (%d+)$",
  "^(الغاء عام)$",
  "^(الغاء عام) (@[%a%d_]+)$",
  "^(الغاء عام) (%d+)$",
  "^(حظر)$",
  "^(حظر) (@[%a%d_]+)$",
  "^(حظر) (%d+)$",
  "^(الغاء الحظر)$", 
  "^(الغاء الحظر) (@[%a%d_]+)$",
  "^(الغاء الحظر) (%d+)$",
  "^(الغاء حظر)$", 
  "^(الغاء حظر) (@[%a%d_]+)$",
  "^(الغاء حظر) (%d+)$",
  "^(طرد)$",
  "^(طرد) (@[%a%d_]+)$",
  "^(طرد) (%d+)$",
  "^(كتم)$",
  "^(كتم) (@[%a%d_]+)$",
  "^(كتم) (%d+)$",
  "^(الغاء الكتم)$",
  "^(الغاء الكتم) (@[%a%d_]+)$",
  "^(الغاء الكتم) (%d+)$",
  "^(الغاء كتم)$",
  "^(الغاء كتم) (@[%a%d_]+)$",
  "^(الغاء كتم) (%d+)$",
  "^(رفع مطور)$",
  "^(رفع مطور) (@[%a%d_]+)$",
  "^(رفع مطور) (%d+)$",
  "^(تنزيل هكر)$",
  "^(تنزيل هكر) (%d+)$",
  "^(تنزيل هكر) (@[%a%d_]+)$",
  "^(تعطيل) (-%d+)$",
  "^(الاشتراك) ([123])$",
  "^(الاشتراك)$",
  "^(تنزيل الكل)$", 
  "^(شحن) (%d+)$",
  "^(المجموعه)$",
  "^(كشف البوت)$",
  "^(انشاء رابط)$",
  "^(ضع الرابط)$",
  "^(تثبيت)$",
  "^(الغاء التثبيت)$",
  "^(الغاء تثبيت)$",
  "^(رابط)$",
  "^(الرابط)$",
  "^(ضع رابط)$",
  "^(رابط خاص)$",
  "^(الرابط خاص)$",
  "^(القوانين)$",
  "^(ضع القوانين)$",
  "^(ضع قوانين)$",
  "^(ضع تكرار)$",
  "^(ضع التكرار)$",
  "^(الادمنيه)$",
  "^(تاك للكل)$",
  "^(نذار)$",
  "^(تاك)$",
  "^(قائمه المنع)$",
  "^(المدراء)$",
  "^(المميزين)$",
  "^(المكتومين)$",
  "^(ضع الترحيب)$",
  "^(الترحيب)$",
  "^(المنشى الاساسي)$",
  "^(المنشئ الاساسي)$",
  "^(المحظورين)$",
  "^(ضع اسم)$",
  "^(ضع صوره)$",
  "^(ضع وصف)$",
  "^(طرد البوتات)$",
  "^(كشف البوتات)$",
  "^(طرد المحذوفين)$",
  "^(رسائلي)$",
  "^(رسايلي)$",
  "^(احصائياتي)$",
  "^(معلوماتي)$",
  "^(مسح معلوماتي)$",
  "^(موقعي)$",
  "^(رفع الادمنيه)$",
  "^(صوره الترحيب)$",
  "^(ضع كليشه المطور)$",
  "^(المطور)$",
  "^(شرط التفعيل)$",
  "^(قائمه المجموعات)$",
  "^(المجموعات)$",
  "^(المجموعات 🌋)$",
  "^(المشتركين)$",
  "^(المشتركين Ⓜ)$",
  "^(اذاعه)$",
  "^(اذاعه عام)$",
  "^(ااذاعه بالتثبيت ♥)$",
  "^(ااذاعه بالتثبيت)$",
  "^(اذاعه خاص)$",
  "^(اذاعه عام بالتوجيه)$",
  "^(اذاعه عام بالتوجيه 📣)$", 
  "^(اذاعه خاص 🗣)$", 
  "^(اذاعه عام 📢)$", 
  "^(اذاعه 🗣)$", 
  "^(قائمه العام)$",
  "^(قائمه العام 📜)$",
  "^(المطورين)$",
  "^(المطورين 🔥)$",
  "^(تيست)$",
  "^(test)$",
  "^(ايديي🆔)$",
  "^(قناة السورس)$",
  "^(الاحصائيات)$",
  "^(الاحصائيات 💥)$",
  "^(اضف رد عام)$",
  "^(اضف رد عام ➕)$",
  "^(مسح الردود)$",
  "^(مسح الردود العامه)$",
  "^(ضع اسم للبوت)$",
  "^(مسح الصوره)$",
  "^(مسح رد)$",
  "^(الردود)$",
  "^(الردود العامه)$",
  "^(الردود العامه 🗨)$",
  "^(اضف رد)$",
  "^(/UpdateSource)$",
  "^(تحديث السورس 🔂)$",
  "^(تحديث السورس)$",
  "^(تنظيف المجموعات)$",
  "^(تنظيف المشتركين)$",
  "^(تنظيف المجموعات 🗑)$",
  "^(تنظيف المشتركين 🗑)$",
  "^(رتبتي)$",
  "^(ضع اسم للبوت ©)$",
  "^(ضع صوره للترحيب 🌄)$",
  "^(ضع صوره للترحيب)$",
  "^(الحمايه)$",
  "^(تفعيل المطور)$",
  "^(تعطيل المطور)$",
  "^(الاعدادات)$",
  "^(الوسائط)$",
  "^(الغاء الامر ✖️)$",
  "^(الرتبه)$",
  "^(الغاء)$",
  "^(سحكاتي)$",
  "^(اسمي)$",
  "^(التاريخ)$",
  "^(/[Ss]tore)$",
  "^(اصدار السورس)$",
  "^(الاصدار)$",
  "^(server)$",
  "^(السيرفر)$",
  "^(فحص البوت)$", 
  "^(نسخه احتياطيه للمجموعات)$",
  "^(رفع نسخه الاحتياطيه)$", 
  "^(تفعيل الاشتراك الاجباري)$", 
  "^(تعطيل الاشتراك الاجباري)$", 
  "^(تغيير الاشتراك الاجباري)$", 
  "^(الاشتراك الاجباري)$", 
  "^(تفعيل الاشتراك الاجباري ☑)$", 
  "^(تعطيل الاشتراك الاجباري ♻️)$", 
  "^(تغيير الاشتراك الاجباري 🔁)$", 
  "^(الاشتراك الاجباري ⚠️)$", 
  "^(احظرني)$", 
  "^(اطردني)$", 
  "^(جهاتي)$", 
  "^(اذاعه بالتثبيت)$", 
  
  
  
  
  
  
  
    "^(افلام)$",
	

  "^(السورس)$",
  "^(سورس)$",
  "^(م المطور)$", 
  "^(اوامر الرد)$",
  "^(الاوامر)$",
  "^(م1)$",
  "^(م2)$",
  "^(م3)$",
  "^(م4)$",
  "^(م5)$",
  "^(م6)$",
  "^(م7)$",
  "^(م8)$",

  
  
   
   
   },
   imark = imark,
   dmark = dmark,
   }
  
