function on_msg_receive (msg)
--    if msg.out then                  -- Disable to allow self user commnad messages
    if string.find(msg.text,'->') then -- Avoid reentrance (any answer will include "->" )
        return
    end
    if (msg.to.type=='chat') and (msg.to.print_name=='Telepi') then
    	if (msg.text=='ping') then
        	send_msg (msg.to.print_name , '-> pong' , ok_cb, false)
    	else
                local handle = io.popen('php telepi.php '.. msg.text)
--              os.execute('php telepi.php '.. msg.text)
--              local handle = io.open("output.txt", "rb")
                local result = handle:read("*a")
                handle:close()
        	send_msg (msg.to.print_name, "-> "..result , ok_cb, false)
        end
    end
    if (msg.from.type=='chat') and (msg.from.print_name=='Telepi') then
        if (msg.text=='ping') then
                send_msg (msg.from.print_name , '-> pong' , ok_cb, false)
        else
                local handle = io.popen('php telepi.php '.. msg.text)
                local result = handle:read("*a")
                handle:close()
                send_msg (msg.to.print_name, "-> "..result , ok_cb, false)
        end
    end
end

function ok_cb(extra, success, result)
end


function on_our_id (id)
end

function on_secret_chat_created (peer)
end

function on_user_update (user)
end

function on_chat_update (user)
end

function on_get_difference_end ()
end

function on_binlog_replay_end ()
end
