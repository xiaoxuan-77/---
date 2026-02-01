-- [[ 🛡️ Neko Hub 設備偵測系統 ]] --
local UIS = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")

-- 定義你的 GitHub 連結 (請自行替換)
local Mobile_Script_URL = "https://pastebin.com/raw/47b5Ge1e"
local PC_Script_URL     = "https://raw.githubusercontent.com/xiaoxuan-77/CAT/refs/heads/main/pct.lua"

local function ExecuteHardwareSpecificScript()
    -- 偵測邏輯：判斷是否有觸控螢幕且沒有鍵盤（通常是手機/平板）
    local isMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled
    
    -- 高強度 pcall 包裝執行
    local success, err = pcall(function()
        if isMobile then
            -- [手機端 A 腳本執行]
            print("📱 偵測到手機設備，正在載入手機專用腳本...")
            loadstring(game:HttpGet(Mobile_Script_URL))()
        else
            -- [電腦端 B 腳本執行]
            print("💻 偵測到電腦設備，正在載入 PC 專業版腳本...")
            loadstring(game:HttpGet(PC_Script_URL))()
        end
    end)

    if not success then
        warn("❌ 腳本執行失敗，請檢查網路或 GitHub 連結: " .. tostring(err))
    end
end

-- 執行偵測
ExecuteHardwareSpecificScript()
