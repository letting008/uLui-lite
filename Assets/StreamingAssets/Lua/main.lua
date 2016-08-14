import "UnityEngine"
import "UnityEngine.Object"
import "UnityEngine.UI"
import "UnityEngine.SceneManagement"
import "Lui"
require "import"

local function main()
	print("初始化游戏")

	NetworkManager:GetInstance()

	LLoadBundle.GetInstance():LoadAllBundles({"scenebundles","prefabbundles","digit1","face01","face02","mytest"},function()
	-- 	local wm = LWindowManager.GetInstance();
	-- 	wm:runWindow("MsgBox", 1)
		local lab_progress = GameObject.Find("lab_progress"):GetComponent(Text)

		LWindowManager:GetInstance():LoadSceneAsync("first",function( p )
			lab_progress.text = string.format("初始化需要一点点时间(%d/100)",p)
		end)
	end)

	-- LTextureAtlas:GetInstance():LoadData("mytest")

	-- local sp = LTextureAtlas:GetInstance():getSprite("cat_pic")
	-- local obj = GameObject()
	-- local imageComp = obj:AddComponent(Image)
	-- imageComp.sprite = sp
	-- imageComp:SetNativeSize();
	-- obj.transform:SetParent(GameObject.Find("Canvas").transform)

	-- Object.Destroy(obj)
	-- LTextureAtlas:GetInstance():RemoveTexture("test")

	

end

-- Declare global function.
LDeclare("main", main)

return main
