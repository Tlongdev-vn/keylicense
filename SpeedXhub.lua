-- =================================================================
-- HỆ THỐNG GET KEY SOLIX HUB - TLONG SYSTEM (MODERN & PREMIUM UI)
-- =================================================================

local DOMAIN_VERCEL_1 = "https://keylicensenew2.vercel.app/"
local DOMAIN_VERCEL_2 = "https://keylicense-krnl.vercel.app/"
local DISCORD_INVITE = "https://discord.gg/TvwRC4tba"
local DISCORD_ICON_URL = "rbxassetid://99761773347476"
local SAVE_FILE_NAME = "TLongSystem.txt"

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

-- =================================================================
-- BẢNG NGÔN NGỮ (LANGUAGE DICTIONARY) - DEFAULT: EN
-- =================================================================
local currentLang = "EN"

local Translations = {
    EN = {
        Title = "TLONG SYSTEM",
        SubTitle = "Speed X Hub Key Verification",
        Placeholder = "🔑 Enter Your Key Here...",
        GetKey1 = "🔗 LINK4M",
        GetKey2 = "🔗 LINKVERTISE",
        CheckKey = "⚡ VERIFY KEY",
        DefaultStatus = "🕒 Key resets automatically every day at 00:00 (GMT+7)",
        DiscordSub = "🟢 Join Discord Support Server",
        CopyBtn = "Copy",
        CopiedBtn = "✔ COPIED",
        CopyDiscordStatus = "💬 Discord link copied! Opened app if available.",
        CopyKey1Status = "📋 Link4m link copied! Paste it in your browser.",
        CopyKey2Status = "📋 Linkvertise link copied! Paste it in your browser.",
        CheckingStatus = "🔍 Validating key, please wait...",
        CheckingBtn = "⏳ VERIFYING...",
        ValidStatus = "✔ Success! Launching Speed X Hub...",
        SuccessBtn = "🎉 SUCCESS",
        InvalidStatus = "✖ Invalid key or key has expired today!",
        LangToggleText = "🌐 EN",
        NoteTitle = "📌 IMPORTANT NOTES",
        NoteText = "• Access link to get today's key.\n• 1 Key per device only.\n• Keys auto-reset at 00:00 (Vietnam Time).\n• Join Discord if you encounter any errors.\n• TikTok: Royah Roblox or @python_c3"
    },
    VI = {
        Title = "TLONG SYSTEM",
        SubTitle = "Xác Thực Key Speed X Hub",
        Placeholder = "🔑 Nhập Key xác thực vào đây...",
        GetKey1 = "🔗 LINK4M",
        GetKey2 = "🔗 LINKVERTISE",
        CheckKey = "⚡ XÁC THỰC KEY",
        DefaultStatus = "🕒 Key tự động làm mới lúc 00:00 hàng ngày",
        DiscordSub = "🟢 Tham gia Discord Trợ Giúp",
        CopyBtn = "Sao Chép",
        CopiedBtn = "✔ ĐÃ COPY",
        CopyDiscordStatus = "💬 Đã copy link Discord! Đã mở app (nếu có).",
        CopyKey1Status = "📋 Đã copy Link4m! Hãy dán vào trình duyệt.",
        CopyKey2Status = "📋 Đã copy Linkvertise! Hãy dán vào trình duyệt.",
        CheckingStatus = "🔍 Đang kiểm tra key, vui lòng chờ...",
        CheckingBtn = "⏳ ĐANG DUYỆT...",
        ValidStatus = "✔ Thành công! Đang khởi chạy Speed X Hub...",
        SuccessBtn = "🎉 THÀNH CÔNG",
        InvalidStatus = "✖ Key không hợp lệ hoặc đã hết hạn!",
        LangToggleText = "🌐 VI",
        NoteTitle = "📌 LƯU Ý QUAN TRỌNG",
        NoteText = "• Truy cập link web để lấy Key trong ngày.\n• Mỗi Key chỉ áp dụng cho 1 thiết bị.\n• Key tự động làm mới vào 00:00 (Giờ VN).\n• Tham gia Discord để được hỗ trợ khi gặp lỗi.\n• TikTok: Royah Roblox hoặc @python_c3"
    }
}

-- Hàm lấy định dạng ngày GMT+7 (DDMMYYYY)
local function GetCurrentDateString()
    local date = os.date("!*t", os.time() + (7 * 3600))
    return string.format("%02d%02d%04d", date.day, date.month, date.year)
end

-- Hàm khởi chạy Script chính
local function LaunchMainScript()
    task.spawn(function()
        local success, result = pcall(function()
            return loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
        end)
        if not success then
            warn("[Speed X Hub Error]:", result)
        end
    end)
end

-- =================================================================
-- ⚡ KIỂM TRA KEY ĐÃ SỬ DỤNG TRƯỚC ĐÓ CHƯA
-- =================================================================
local todayDateStr = GetCurrentDateString()

local function CheckSavedKeyStatus()
    if readfile and isfile and isfile(SAVE_FILE_NAME) then
        local savedData = readfile(SAVE_FILE_NAME)
        if savedData == todayDateStr then
            return true
        end
    end
    return false
end

if CheckSavedKeyStatus() then
    print("[TLong System]: Key already verified today. Launching script...")
    LaunchMainScript()
    return
end

-- =================================================================
-- KHỞI TẠO UI PHONG CÁCH PREMIUM
-- =================================================================

if CoreGui:FindFirstChild("TLongHub_GetKeyUI") then
    CoreGui.TLongHub_GetKeyUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TLongHub_GetKeyUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- Khung chính
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Size = UDim2.new(0, 380, 0, 440)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 13, 24)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

-- Viền Rainbow dịu nhẹ
local RainbowStroke = Instance.new("UIStroke")
RainbowStroke.Thickness = 1.5
RainbowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
RainbowStroke.Parent = MainFrame

RunService.RenderStepped:Connect(function()
    if MainFrame and MainFrame.Parent then
        local hue = (tick() * 0.15) % 1
        RainbowStroke.Color = Color3.fromHSV(hue, 0.65, 0.95)
    end
end)

-- Top Header Container
local HeaderFrame = Instance.new("Frame")
HeaderFrame.Size = UDim2.new(1, -28, 0, 42)
HeaderFrame.Position = UDim2.new(0, 14, 0, 12)
HeaderFrame.BackgroundTransparency = 1
HeaderFrame.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -70, 0, 20)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = Translations[currentLang].Title
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 15
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = HeaderFrame

local SubTitleLabel = Instance.new("TextLabel")
SubTitleLabel.Size = UDim2.new(1, -70, 0, 16)
SubTitleLabel.Position = UDim2.new(0, 0, 0, 20)
SubTitleLabel.BackgroundTransparency = 1
SubTitleLabel.Text = Translations[currentLang].SubTitle
SubTitleLabel.TextColor3 = Color3.fromRGB(130, 125, 160)
SubTitleLabel.TextSize = 10
SubTitleLabel.Font = Enum.Font.GothamMedium
SubTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
SubTitleLabel.Parent = HeaderFrame

-- Nút Chuyển Đổi Ngôn Ngữ Premium
local LangBtn = Instance.new("TextButton")
LangBtn.Size = UDim2.new(0, 58, 0, 26)
LangBtn.Position = UDim2.new(1, -58, 0, 6)
LangBtn.BackgroundColor3 = Color3.fromRGB(28, 24, 48)
LangBtn.Text = Translations[currentLang].LangToggleText
LangBtn.TextColor3 = Color3.fromRGB(255, 215, 100)
LangBtn.TextSize = 10.5
LangBtn.Font = Enum.Font.GothamBold
LangBtn.Parent = HeaderFrame

local LangCorner = Instance.new("UICorner")
LangCorner.CornerRadius = UDim.new(0, 8)
LangCorner.Parent = LangBtn

local LangStroke = Instance.new("UIStroke")
LangStroke.Color = Color3.fromRGB(60, 50, 95)
LangStroke.Thickness = 1
LangStroke.Parent = LangBtn

-- Ô Nhập Key
local InputFrame = Instance.new("Frame")
InputFrame.Size = UDim2.new(1, -28, 0, 38)
InputFrame.Position = UDim2.new(0, 14, 0, 62)
InputFrame.BackgroundColor3 = Color3.fromRGB(22, 19, 36)
InputFrame.Parent = MainFrame

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 9)
InputCorner.Parent = InputFrame

local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Color3.fromRGB(45, 38, 72)
InputStroke.Thickness = 1.2
InputStroke.Parent = InputFrame

local InputBox = Instance.new("TextBox")
InputBox.Size = UDim2.new(1, -20, 1, 0)
InputBox.Position = UDim2.new(0, 10, 0, 0)
InputBox.BackgroundTransparency = 1
InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
InputBox.PlaceholderColor3 = Color3.fromRGB(110, 105, 135)
InputBox.PlaceholderText = Translations[currentLang].Placeholder
InputBox.Text = ""
InputBox.TextSize = 11.5
InputBox.Font = Enum.Font.GothamMedium
InputBox.ClearTextOnFocus = false
InputBox.Parent = InputFrame

-- Hàng 1: Nút Link4m & Linkvertise
local GetKeyRow = Instance.new("Frame")
GetKeyRow.Size = UDim2.new(1, -28, 0, 34)
GetKeyRow.Position = UDim2.new(0, 14, 0, 108)
GetKeyRow.BackgroundTransparency = 1
GetKeyRow.Parent = MainFrame

local GetKeyBtn1 = Instance.new("TextButton")
GetKeyBtn1.Size = UDim2.new(0.5, -5, 1, 0)
GetKeyBtn1.BackgroundColor3 = Color3.fromRGB(0, 180, 216)
GetKeyBtn1.Text = Translations[currentLang].GetKey1
GetKeyBtn1.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn1.TextSize = 11
GetKeyBtn1.Font = Enum.Font.GothamBold
GetKeyBtn1.AutoButtonColor = false
GetKeyBtn1.Parent = GetKeyRow

local GetKey1Corner = Instance.new("UICorner")
GetKey1Corner.CornerRadius = UDim.new(0, 8)
GetKey1Corner.Parent = GetKeyBtn1

local GetKeyBtn2 = Instance.new("TextButton")
GetKeyBtn2.Size = UDim2.new(0.5, -5, 1, 0)
GetKeyBtn2.Position = UDim2.new(0.5, 5, 0, 0)
GetKeyBtn2.BackgroundColor3 = Color3.fromRGB(247, 127, 0)
GetKeyBtn2.Text = Translations[currentLang].GetKey2
GetKeyBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn2.TextSize = 11
GetKeyBtn2.Font = Enum.Font.GothamBold
GetKeyBtn2.AutoButtonColor = false
GetKeyBtn2.Parent = GetKeyRow

local GetKey2Corner = Instance.new("UICorner")
GetKey2Corner.CornerRadius = UDim.new(0, 8)
GetKey2Corner.Parent = GetKeyBtn2

-- Hàng 2: Nút Verify Key
local CheckKeyBtn = Instance.new("TextButton")
CheckKeyBtn.Size = UDim2.new(1, -28, 0, 36)
CheckKeyBtn.Position = UDim2.new(0, 14, 0, 150)
CheckKeyBtn.BackgroundColor3 = Color3.fromRGB(114, 9, 183)
CheckKeyBtn.Text = Translations[currentLang].CheckKey
CheckKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckKeyBtn.TextSize = 12
CheckKeyBtn.Font = Enum.Font.GothamBold
CheckKeyBtn.AutoButtonColor = false
CheckKeyBtn.Parent = MainFrame

local CheckCorner = Instance.new("UICorner")
CheckCorner.CornerRadius = UDim.new(0, 9)
CheckCorner.Parent = CheckKeyBtn

-- Banner Trạng Thái
local StatusBanner = Instance.new("Frame")
StatusBanner.Size = UDim2.new(1, -28, 0, 28)
StatusBanner.Position = UDim2.new(0, 14, 0, 194)
StatusBanner.BackgroundColor3 = Color3.fromRGB(22, 18, 38)
StatusBanner.Parent = MainFrame

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 7)
StatusCorner.Parent = StatusBanner

local StatusMsg = Instance.new("TextLabel")
StatusMsg.Size = UDim2.new(1, -16, 1, 0)
StatusMsg.Position = UDim2.new(0, 8, 0, 0)
StatusMsg.BackgroundTransparency = 1
StatusMsg.Text = Translations[currentLang].DefaultStatus
StatusMsg.TextColor3 = Color3.fromRGB(170, 165, 200)
StatusMsg.TextSize = 9.5
StatusMsg.Font = Enum.Font.GothamMedium
StatusMsg.TextWrapped = true
StatusMsg.Parent = StatusBanner

-- Discord Card
local DiscordCard = Instance.new("Frame")
DiscordCard.Size = UDim2.new(1, -28, 0, 50)
DiscordCard.Position = UDim2.new(0, 14, 0, 230)
DiscordCard.BackgroundColor3 = Color3.fromRGB(22, 20, 42)
DiscordCard.Parent = MainFrame

local DiscordCorner = Instance.new("UICorner")
DiscordCorner.CornerRadius = UDim.new(0, 9)
DiscordCorner.Parent = DiscordCard

local DiscordStroke = Instance.new("UIStroke")
DiscordStroke.Color = Color3.fromRGB(88, 101, 242)
DiscordStroke.Thickness = 1
DiscordStroke.Parent = DiscordCard

local DiscordAvatar = Instance.new("ImageLabel")
DiscordAvatar.Size = UDim2.new(0, 34, 0, 34)
DiscordAvatar.Position = UDim2.new(0, 10, 0.5, -17)
DiscordAvatar.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscordAvatar.Image = DISCORD_ICON_URL
DiscordAvatar.Parent = DiscordCard

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(1, 0)
AvatarCorner.Parent = DiscordAvatar

local ServerName = Instance.new("TextLabel")
ServerName.Size = UDim2.new(0, 170, 0, 18)
ServerName.Position = UDim2.new(0, 52, 0, 8)
ServerName.BackgroundTransparency = 1
ServerName.Text = "TLong System Community"
ServerName.TextColor3 = Color3.fromRGB(255, 255, 255)
ServerName.TextSize = 11.5
ServerName.Font = Enum.Font.GothamBold
ServerName.TextXAlignment = Enum.TextXAlignment.Left
ServerName.Parent = DiscordCard

local ServerSub = Instance.new("TextLabel")
ServerSub.Size = UDim2.new(0, 170, 0, 14)
ServerSub.Position = UDim2.new(0, 52, 0, 26)
ServerSub.BackgroundTransparency = 1
ServerSub.Text = Translations[currentLang].DiscordSub
ServerSub.TextColor3 = Color3.fromRGB(80, 255, 160)
ServerSub.TextSize = 9
ServerSub.Font = Enum.Font.GothamMedium
ServerSub.TextXAlignment = Enum.TextXAlignment.Left
ServerSub.Parent = DiscordCard

local JoinDiscordBtn = Instance.new("TextButton")
JoinDiscordBtn.Size = UDim2.new(0, 88, 0, 28)
JoinDiscordBtn.Position = UDim2.new(1, -96, 0.5, -14)
JoinDiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
JoinDiscordBtn.Text = Translations[currentLang].CopyBtn
JoinDiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
JoinDiscordBtn.TextSize = 10.5
JoinDiscordBtn.Font = Enum.Font.GothamBold
JoinDiscordBtn.Parent = DiscordCard

local JoinCorner = Instance.new("UICorner")
JoinCorner.CornerRadius = UDim.new(0, 7)
JoinCorner.Parent = JoinDiscordBtn

-- Note Card
local NoteCard = Instance.new("Frame")
NoteCard.Size = UDim2.new(1, -28, 0, 140)
NoteCard.Position = UDim2.new(0, 14, 0, 288)
NoteCard.BackgroundColor3 = Color3.fromRGB(20, 16, 32)
NoteCard.Parent = MainFrame

local NoteCardCorner = Instance.new("UICorner")
NoteCardCorner.CornerRadius = UDim.new(0, 9)
NoteCardCorner.Parent = NoteCard

local NoteHeader = Instance.new("TextLabel")
NoteHeader.Size = UDim2.new(1, -16, 0, 18)
NoteHeader.Position = UDim2.new(0, 10, 0, 6)
NoteHeader.BackgroundTransparency = 1
NoteHeader.Text = Translations[currentLang].NoteTitle
NoteHeader.TextColor3 = Color3.fromRGB(255, 160, 120)
NoteHeader.TextSize = 10
NoteHeader.Font = Enum.Font.GothamBold
NoteHeader.TextXAlignment = Enum.TextXAlignment.Left
NoteHeader.Parent = NoteCard

local NoteLabel = Instance.new("TextLabel")
NoteLabel.Size = UDim2.new(1, -20, 1, -30)
NoteLabel.Position = UDim2.new(0, 10, 0, 26)
NoteLabel.BackgroundTransparency = 1
NoteLabel.TextColor3 = Color3.fromRGB(190, 185, 210)
NoteLabel.TextSize = 9
NoteLabel.Font = Enum.Font.Gotham
NoteLabel.TextWrapped = true
NoteLabel.TextYAlignment = Enum.TextYAlignment.Top
NoteLabel.TextXAlignment = Enum.TextXAlignment.Left
NoteLabel.Text = Translations[currentLang].NoteText
NoteLabel.Parent = NoteCard

-- =================================================================
-- HÀM CẬP NHẬT NGÔN NGỮ UI
-- =================================================================
local function UpdateLanguageUI()
    local t = Translations[currentLang]
    TitleLabel.Text = t.Title
    SubTitleLabel.Text = t.SubTitle
    InputBox.PlaceholderText = t.Placeholder
    GetKeyBtn1.Text = t.GetKey1
    GetKeyBtn2.Text = t.GetKey2
    CheckKeyBtn.Text = t.CheckKey
    StatusMsg.Text = t.DefaultStatus
    ServerSub.Text = t.DiscordSub
    JoinDiscordBtn.Text = t.CopyBtn
    NoteHeader.Text = t.NoteTitle
    NoteLabel.Text = t.NoteText
    LangBtn.Text = t.LangToggleText
end

LangBtn.MouseButton1Click:Connect(function()
    currentLang = (currentLang == "EN") and "VI" or "EN"
    UpdateLanguageUI()
end)

-- =================================================================
-- HIỆU ỨNG TƯƠNG TÁC (TWEEN & HOVER EFFECTS)
-- =================================================================

local function SetupHoverEffect(button, defaultBg, hoverBg)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3 = hoverBg}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3 = defaultBg}):Play()
    end)
end

SetupHoverEffect(GetKeyBtn1, Color3.fromRGB(0, 180, 216), Color3.fromRGB(0, 205, 245))
SetupHoverEffect(GetKeyBtn2, Color3.fromRGB(247, 127, 0), Color3.fromRGB(255, 145, 20))
SetupHoverEffect(CheckKeyBtn, Color3.fromRGB(114, 9, 183), Color3.fromRGB(135, 15, 215))
SetupHoverEffect(JoinDiscordBtn, Color3.fromRGB(88, 101, 242), Color3.fromRGB(108, 121, 255))

local function PlayBounce(btn)
    local origSize = btn.Size
    local origPos = btn.Position
    local shrinkSize = UDim2.new(origSize.X.Scale, origSize.X.Offset - 3, origSize.Y.Scale, origSize.Y.Offset - 3)
    local shrinkPos = UDim2.new(origPos.X.Scale, origPos.X.Offset + 1.5, origPos.Y.Scale, origPos.Y.Offset + 1.5)
    
    local t1 = TweenService:Create(btn, TweenInfo.new(0.06, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = shrinkSize, Position = shrinkPos})
    local t2 = TweenService:Create(btn, TweenInfo.new(0.09, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = origSize, Position = origPos})
    t1:Play()
    t1.Completed:Connect(function() t2:Play() end)
end

local function SetClipboardSafe(text)
    if setclipboard then setclipboard(text) elseif toclipboard then toclipboard(text) end
end

local function PlaySuccessFadeOut()
    local duration = 0.45
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)

    TweenService:Create(MainFrame, tweenInfo, {
        Position = UDim2.new(0.5, 0, 0.56, 0),
        BackgroundTransparency = 1
    }):Play()

    TweenService:Create(RainbowStroke, tweenInfo, {Transparency = 1}):Play()

    for _, desc in ipairs(MainFrame:GetDescendants()) do
        if desc:IsA("Frame") then
            TweenService:Create(desc, tweenInfo, {BackgroundTransparency = 1}):Play()
        elseif desc:IsA("TextLabel") or desc:IsA("TextButton") or desc:IsA("TextBox") then
            TweenService:Create(desc, tweenInfo, {BackgroundTransparency = 1, TextTransparency = 1}):Play()
        elseif desc:IsA("ImageLabel") then
            TweenService:Create(desc, tweenInfo, {BackgroundTransparency = 1, ImageTransparency = 1}):Play()
        elseif desc:IsA("UIStroke") then
            TweenService:Create(desc, tweenInfo, {Transparency = 1}):Play()
        end
    end

    task.wait(duration)
    ScreenGui:Destroy()
end

-- =================================================================
-- SỰ KIỆN XỬ LÝ NÚT BẤM
-- =================================================================

JoinDiscordBtn.MouseButton1Click:Connect(function()
    PlayBounce(JoinDiscordBtn)
    SetClipboardSafe(DISCORD_INVITE)
    
    if request then
        pcall(function()
            request({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {["Content-Type"] = "application/json", ["Origin"] = "https://discord.com"},
                Body = game:GetService("HttpService"):JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = {code = "TvwRC4tba"},
                    nonce = game:GetService("HttpService"):GenerateGUID(false)
                })
            })
        end)
    end
    
    StatusBanner.BackgroundColor3 = Color3.fromRGB(30, 35, 75)
    StatusMsg.TextColor3 = Color3.fromRGB(130, 160, 255)
    StatusMsg.Text = Translations[currentLang].CopyDiscordStatus
    
    JoinDiscordBtn.Text = Translations[currentLang].CopiedBtn
    task.delay(2, function()
        if