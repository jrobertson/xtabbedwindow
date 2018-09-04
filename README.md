# Introducing the xtabbedwindow gem

    require 'xtabbedwindow'

    console = XDo::XWindow.from_active

    browser = XTabbedWindow.new('Firefox')
    browser.goto_tab 'Twitter'

    console.activate


In the above example the xtabbedwindow gem is used to select the Twitter tab from the web browser Firefox.

Note: It is assumed that Firefox is currently running and that the Twitter web page is loaded in one of the tabls. The xtabbedwindow gem uses the gems ruby-cmtrl and xdo which run on X11 Windows only.

## Resources

* xtabbedwindow https://rubygems.org/gems/xtabbedwindow

xtabbedwindow gem window automation tabbed tab document x11
