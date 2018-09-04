#!/usr/bin/env ruby

# file: xtabbedwindow.rb

require 'wmctrl'
require "xdo/xwindow"
require "xdo/keyboard"


class XTabbedWindow

  attr_reader :window, :tabs

  def initialize(name, new_tab: "Ctrl+t", scan_tabs: true)

    @new_tab = new_tab
    a = WMCtrl.instance.windows
    @window = a.detect {|x| x.title =~ /#{name}/i}

    if @window
      sleep 0.3
      @window.activate
    end
    
    @tabs = []

    read_tabs() if scan_tabs

  end

  def goto_tab(pattern)
    
    read_tabs if @tabs.empty?

    regex = pattern.is_a?(String) ? /^#{pattern}/i : pattern

    a = @tabs
    r = a.grep(regex)

    if r.empty? and pattern.is_a? String then
      regex = /#{pattern}/i
      r = a.grep(regex)
    end

    return if r.empty?

    i = a.index(r.first)

    @window.activate
    sleep 0.1

    XDo::Keyboard.char("Alt+1")
    sleep 0.1
    i.times { XDo::Keyboard.char("Ctrl+Tab") }

  end
  
  def new_tab()
    @window.activate
    sleep 0.05
    XDo::Keyboard.char(@new_tab)    
    sleep 0.3
  end

  def next_tab()
    sleep 0.05
    XDo::Keyboard.char("Ctrl+Tab")
  end

  def read_tabs()

    XDo::Keyboard.char("Alt+1")

    start_tab_title = title()
    @tabs = [start_tab_title]
    
    next_tab()
    window_title = title()

    while window_title != start_tab_title do

      @tabs << window_title
      next_tab()
      window_title = title()

    end

    @tabs

  end  
  
  def tab?(obj)
    
    read_tabs if @tabs.empty?
    regex = obj.is_a?(String) ? /^#{obj}|#{obj}/ : obj
    @tabs.grep(regex).any?
    
  end

  def title()
    sleep 0.05
    XDo::XWindow.from_active.title
  end

end
