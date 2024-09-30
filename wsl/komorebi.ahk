#Requires AutoHotkey v2.0.2
#SingleInstance Force

Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

; quit and close window
#s::Komorebic("start --ahk")
#q::Komorebic("stop")
#c::Komorebic("close")
#m::Komorebic("manage")
#u::Komorebic("unmanage")

; hjkl to move focus
#h::Komorebic("focus left")
#j::Komorebic("focus down")
#k::Komorebic("focus up")
#l::Komorebic("focus right")

; shift-hjkl to move window
+#h::Komorebic("move left")
+#j::Komorebic("move down")
+#k::Komorebic("move up")
+#l::Komorebic("move right")

; switch monitor
#Tab::Komorebic("cycle-monitor next")
!#Tab::Komorebic("cycle-monitor previous")

; switch window in workspace
!Tab::Komorebic("cycle-focus next")
!+Tab::Komorebic("cycle-focus previous")

; switch to specific workspace by number
#1::Komorebic("focus-monitor-workspace 1 0")
#2::Komorebic("focus-monitor-workspace 1 1")
#3::Komorebic("focus-monitor-workspace 1 2")
#4::Komorebic("focus-monitor-workspace 0 0")
#5::Komorebic("focus-monitor-workspace 0 1")
#6::Komorebic("focus-monitor-workspace 0 2")

; move to specific workspace by number
+#1::Komorebic("move-to-monitor-workspace 1 0")
+#2::Komorebic("move-to-monitor-workspace 1 1")
+#3::Komorebic("move-to-monitor-workspace 1 2")
+#4::Komorebic("move-to-monitor-workspace 0 0")
+#5::Komorebic("move-to-monitor-workspace 0 1")
+#6::Komorebic("move-to-monitor-workspace 0 2")

; cycle layouts
#7::Komorebic("change-layout bsp")
#8::Komorebic("change-layout rows")
#9::Komorebic("cycle-layout next")

; launch chromium
#b::Run("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
