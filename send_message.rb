host_name = ARGV[0]
trigger_status = ARGV[1]
trigger_name = ARGV[2]
severity = ARGV[3]
item_name = ARGV[4]
error = false
msg = "-----Library Miner 通知-----"
msg += "\n"

# 深刻度
case severity.to_s
  when "Warning" then
    msg += "(*) WARNING!! (*) WARNING!!"
  when "Average" then
    msg += "(ghanta) 軽度のエラーを検知!! (ghanta)"
    error = true
  when "High" then
    msg += "(bomb) 重度のエラーを検知!! (bomb)"
    error = true
  when "Disaster"
    msg += "(bomb) 致命的なエラーを検知!! (bomb)"
    error = true
  else
    msg += "(*) お知らせがあるよ (*)"
end
msg += "\n\n"

msg += "時刻：" + (Time.now + 8).to_s + "\n"
msg += "内容：" + trigger_name + "\n"
msg += "host：" + host_name + "\n"

self_path = File.expand_path(File.dirname(__FILE__))
config = eval File.read "#{self_path}/config.rb"
results = system("#{self_path}/send.sh #{config[:chatid]} '#{msg}' #{config[:passwd]} #{config[:msgaddress]}")

