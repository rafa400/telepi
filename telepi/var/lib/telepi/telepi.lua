function on_msg_receive (msg)
--    if msg.out then                  -- Disable to allow self user commnad messages
    if string.find(msg.text,'->') then -- Avoid reentrance (any answer will include "->" )
        return
    end
    if (msg.to.type=='chat') and (msg.to.print_name=='Telepi') then
    	if (msg.text:lower()=='ping') then
        	send_msg (msg.to.print_name , '-> pong' , ok_cb, false)
    	else
                local handle = io.popen('php telepi.php '.. msg.text)
--              os.execute('php telepi.php '.. msg.text)
--              local handle = io.open("output.txt", "rb")
                local result = handle:read("*a")
                handle:close()
                if     string.find(msg.text:lower(),'photo') then
                   send_photo (msg.to.print_name, '/var/lib/telepi/eso.jpg', ok_cb, false)  
                elseif string.find(msg.text:lower(),'video') then
                   send_video (msg.to.print_name, '/var/lib/telepi/eso.mp4', ok_cb, false)
                else
                   send_msg (msg.to.print_name, "-> "..result , ok_cb, false)
                end
        end
    end
    if (msg.from.type=='chat') and (msg.from.print_name=='Telepi') then
        if (msg.text:lower()=='ping') then
                send_msg (msg.from.print_name , '-> pong' , ok_cb, false)
        else
                local handle = io.popen('php telepi.php '.. msg.text)
                local result = handle:read("*a")
                handle:close()
                if (msg.text=='photo') then
                   send_photo (msg.from.print_name, '/var/lib/telepi/eso.jpg', ok_cb, false)
                else
                   send_msg (msg.from.print_name, "-> "..result , ok_cb, false)
                end
                if (msg.text=='video') then
                   send_video (msg.from.print_name, '/var/lib/telepi/eso.mp4', ok_cb, false)
                end
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
