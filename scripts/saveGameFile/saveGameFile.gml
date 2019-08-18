var saveFileName = "savefile0" + string(argument0) + ".sav"
//基礎設定
var rootList = ds_list_create()
var map = ds_map_create()
ds_list_add(rootList,map)
ds_list_mark_as_map(rootList, ds_list_size(rootList) - 1)
//放入需要存的資料
ds_map_add(map,"gameTimeHours", oInGameTime.Hours )
ds_map_add(map,"gameTimeMins", oInGameTime.Mins )
ds_map_add(map,"gameTimeSec", oInGameTime.Sec )
ds_map_add(map,"room", room_get_name(room));

//將以上的資料包起來(warpper)
var wrapper = ds_map_create()
ds_map_add_list(wrapper, "GameSave", rootList) //此sav的Title

//轉成string做成.sav
var saveStr = json_encode(wrapper)
SaveStringToFile(saveFileName, saveStr)	
show_debug_message(saveStr)
//釋放記憶體
ds_map_destroy(wrapper)
ds_map_destroy(map)

return true