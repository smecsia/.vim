if exists("RailsSw*")
  finish
else
  "let root = glob(expand('%:p:h'))
  "exec 'rubyf '.root.'/rails_switch.rb'
 rubyf ~/.vim/plugin/rails_switch.rb
endif
