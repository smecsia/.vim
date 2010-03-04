require 'rubygems'
require 'active_support'

$last_lpos = 0
$last_cpos = [0,0]
def SaveCurPos
  # $curpos = VIM::Window.current.cursor
  VIM::command("normal my")
end

def RestoreCurPos
  # VIM::Window.current.cursor = $last_cpos 
  VIM::command("normal 'y")
  # VIM::Buffer.current.line_number = $last_lpos   
end

def RailsSwC2V
  SaveCurPos()
  cb = VIM::Buffer.current
  cln = cb.line
  defline = VIM::evaluate("getline(search('def ','b'))")
  viewname = ((defline.split('def')[1].chomp)[1..-1]).split(';')[0]
  railsroot = VIM::evaluate("RailsRoot()")
  cnameline = VIM::evaluate("getline(search('Controller < ApplicationController','b'))")
  cname = cnameline.split('Controller < ')[0].chomp.split('class ')[1].underscore
  ok = false
  ['html.erb','haml','prawn','pdf.prawn'].each do |ext|
    path = railsroot + '/' + 'app/views/' + cname + '/' + viewname + '.' + ext
    if File.exist?(path)
      VIM::command('edit ' + path)
      ok = true
    end
  end
  if !ok
    RestoreCurPos()
  end
end






def RailsSwV2C
  SaveCurPos()
  cb = VIM::Buffer.current
  viewpath = VIM::evaluate("glob(expand('%:p'))")
  cname = viewpath.split('/')[-2].downcase
  actname = viewpath.split('/')[-1].split('.')[0]
  railsroot = VIM::evaluate("RailsRoot()")
  path = railsroot + '/' + 'app/controllers/' + cname + '_controller.rb'
  if File.exist?(path)
    VIM::command('edit ' + path + ' | /def ' + actname + '')
  else
    RestoreCurPos()
    # VIM::command('echo "' + path + ' not found!"')
  end
end

VIM::command("function! RailsSwC2V()
ruby RailsSwC2V()
endfunction")

VIM::command("function! RailsSwV2C()
ruby RailsSwV2C()
endfunction")
