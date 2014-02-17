tell application "System Preferences"
    reveal pane "com.apple.preference.mouse"
end tell
tell application "System Events" to tell process "System Preferences"
    set frontmost to true
    tell window "Mouse"
        set natural_scroll to value of checkbox "Scroll direction: natural" as boolean
        if natural_scroll is true then -- we haven't done any modification
            click checkbox "Scroll direction: natural"
            set value of slider 1 to 5.0 -- Tracking 6/10
            set value of slider 2 to 8.0 -- Double-Click 9/11
            set value of slider 3 to 3.0 -- Scrolling 4/8
            tell group 1
                -- Set Expose Desktop on side buttons
                click pop up button 1
                click menu item 3 of menu of pop up button 1
                -- Set Button 3 on scrolling ball
                click pop up button 2
                click menu item "Button 3" of menu of pop up button 2
                -- Set Secondary button for right click
                click pop up button 5
                click menu item 2 of menu of pop up button 5
            end tell
        end if
    end tell
end tell
delay 1 -- Wait a second to form a visual feedback
quit application "System Preferences"
