/// @description Insert description here
// You can write your code in this editor

enum IGMenuScreen{
	off = 0,
	main = 1,
	option = 2
}
IGMenuScreen = IGMenuScreen.off

IGMainMenuText [0, 0] = "RESUME"
IGMainMenuText [0, 1] = "OPTION"
IGMainMenuText [0, 2] = "SAVE & QUIT"

IGMainMenuText [1, 0] = "返回遊戲"
IGMainMenuText [1, 1] = "選項"
IGMainMenuText [1, 2] = "儲存並離開"

LanguageFont[0] = "EquipmentPro.ttf"
LanguageFont[1] = "Chinese.ttf"

//文字設定
MenuFontSize = 11 * global.windowsSize
optionFontSize = 15 * global.windowsSize
MenuFont = font_add(LanguageFont[global.gameLanguage], MenuFontSize, false, false, 0, 65535)
ChooseCuesor = font_add("EquipmentPro.ttf", 17 * global.windowsSize, false, false, 0, 65535)
optionFont = font_add(LanguageFont[global.gameLanguage], optionFontSize, false, false, 0, 65535)
