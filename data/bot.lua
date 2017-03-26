package.path = package.path .. ';.luarocks/share/lua/5.2/?.lua'
  ..';.luarocks/share/lua/5.2/?/init.lua'
package.cpath = package.cpath .. ';.luarocks/lib/lua/5.2/?.so'

JSON = require('dkjson')
serpent = require('serpent')
sudo_users = {
[185532812] = 'Mohammad-Reza👉😐👈',
}

function dl_cb(arg, data)
  vardump(arg)
  vardump(data)
end
function vtext(value)
  return serpent.block(value, {comment=true})
end
function vardump(value, depth, key)
  local linePrefix = ''
  local spaces = ''

  if key ~= nil then
    linePrefix = key .. ' = '
  end

  if depth == nil then
    depth = 0
  else
    depth = depth + 1
    for i=1, depth do 
      spaces = spaces .. '  '
    end
  end

  if type(value) == 'table' then
    mTable = getmetatable(value)
    if mTable == nil then
      print(spaces .. linePrefix .. '(table) ')
    else
      print(spaces .. '(metatable) ')
        value = mTable
    end
    for tableKey, tableValue in pairs(value) do
      vardump(tableValue, depth, tableKey)
    end
  elseif type(value)  == 'function' or 
    type(value) == 'thread' or 
    type(value) == 'userdata' or 
    value == nil then
      print(spaces .. tostring(value))
  elseif type(value)  == 'string' then
    print(spaces .. linePrefix .. '"' .. tostring(value) .. '",')
  else
    print(spaces .. linePrefix .. tostring(value) .. ',')
  end
end
function send_msg(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local function getParseMode(parse_mode)
  if parse_mode then
    local mode = parse_mode:lower()
    if mode == 'html' then
      P = {ID = "TextParseModeHTML"}
    end
  end
  return P
end
  tdcli_function ({
    ID = "SendMessage",
    chat_id_ = chat_id,
    reply_to_message_id_ = reply_to_message_id,
    disable_notification_ = disable_notification,
    from_background_ = 1,
    reply_markup_ = nil,
    input_message_content_ = {
      ID = "InputMessageText",
      text_ = text,
      disable_web_page_preview_ = disable_web_page_preview,
      clear_draft_ = 0,
      entities_ = {},
      parse_mode_ = getParseMode(parse_mode),
    },
  }, dl_cb, nil)
end
function is_sudo(msg)
  local var = false
  for k,v in pairs(sudo_users)do 
    if k == msg.sender_user_id_  then
      var = true
    end
	end
  return var
end

function group_type(msg)
  local var = 'find'
  if type(msg.chat_id_) == 'string' then
  if msg.chat_id_:match('$-100') then
  var = 'cahnnel'
  elseif msg.chat_id_:match('$-10') then
  var = 'chat'
  end
  elseif type(msg.chat_id_) == 'number' then
  var = 'user'
  end  
  return var
  end
function tdcli_update_callback(data)
local msg = data.message_
  if (data.ID == "UpdateNewMessage") then
    if msg.content_.ID == "MessageText" then
	 if msg.content_.text_ and not is_sudo(msg) then
         local text = {
"<code>با عمتی دیه ؟ :|</code>",
"<code>به عمه گرامی سلام برسون :|</code>",
"<code>عمه داری؟ :|</code>",
"<code>با چس ممبر نمی حرفم :|</code>",
"<code>خوش گذشت :|</code>",
"<code>تو وجودت</code>",
  }
        send_msg(msg.chat_id_, msg.id_, 1,text [math.random(#text)] , 1, 'html')
	   elseif msg.content_.text_ == "number" and is_sudo(msg) then
		for i=1 ,100 do
		send_msg(msg.chat_id_, msg.id_, 1, '<code>'..i..'</code>', 1, 'html')
		end
		  elseif msg.content_.text_ == "spam" and is_sudo(msg) then
    send_msg(msg.chat_id_, msg.id_, 1, '<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>\n<code>این گروه هک شد لطفا هرچه سریع تر لفت بدهید</code>', 1, 'html')
   end
   elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
    tdcli_function ({
      ID="GetChats",
      offset_order_="9223372036854775807",
      offset_chat_id_=0,
      limit_=20
    }, dl_cb, nil)
  end
end
end


