require 'date' 
def open_require(open_type)
  case open_type
  when 'e' then open_command = 'edit'
  when 's' then open_command = 'split'
  else open_command = 'tabnew'
  end
  cb = VIM::Buffer.current
  cur_line = cb.line
  if (cur_line.index("Controller < ") != nil && cur_line.index("::Base") == nil)  
    file = (cur_line.split('Controller < ')[1].chomp).gsub("Controller","").downcase + '_controller.rb'
  elsif (cur_line.index(" < ") != nil) 
    file = (cur_line.split(' < ')[1].chomp).downcase.gsub("::","/") + '.rb'
  else
    file = (cur_line.split('require ')[1].chomp)[1..-2] + '.rb'
  end
  cur_dir = VIM::evaluate("glob(expand('%:p:h'))")
  $LOAD_PATH << cur_dir
  $LOAD_PATH.each {|path|
    # p path + '/' + file
    if File.exist?(path + '/' + file) then
      VIM::command("#{open_command} #{path + '/' + file}")
    else
      #     VIM::command("echo '#{path}/#{file} does not exist'")
    end
  }
end

VIM::command("function! OpenRequire(open)
                             ruby open_require(VIM::evaluate('a:open'))
                                             endfunction")
