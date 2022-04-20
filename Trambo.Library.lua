-- Trambo.Library
-- Author="TRAMBO"
-- Version="1.0"

include("karaskel.lua") -- karaskel.lua written by Niels Martin Hansen and Rodrigo Braz Monteiro


function remove_accents_v1(text)
  local aList = "áảàãạâấầẩậẫăắằẳẵặāǎ"
  local AList = "ÁẢÀÃẠÂẤẦẨẬẪĂẮẰẲẴẶĀǍ"
  local oList = "óòỏõọôốồổỗộơớờởỡợǒō"
  local OList = "ÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢǑŌ"
  local eList = "éèẻẽẹêếềểễệēě"
  local EList = "ÉÈẺẼẸÊẾỀỂỄỆĒĚ"
  local iList = "íìỉĩịīǐ"
  local IList = "ÍÌỈĨỊĪǏ"
  local uList = "úùủũụưứừửữựüūǔ"
  local UList = "ÚÙỦŨỤƯỨỪỬỮỰÜŪǓ"
  local yList = "ýỳỷỹỵ"
  local YList = "ÝỲỶỸỴ"

  local nline = ""
  local t = {}

  for c, i in unicode.chars(text) do
    table.insert(t, c)
  end

  local n = 1
  while (n <= #t) do
    if t[n] == "{" then
      while t[n] ~= "}" do
        nline = nline .. t[n]
        n = n + 1
      end
    else
      for c, j in unicode.chars(aList) do
        if t[n] == c then t[n] = "a" end
      end
      for c, j in unicode.chars(AList) do
        if t[n] == c then t[n] = "A" end
      end
      for c, j in unicode.chars(oList) do
        if t[n] == c then t[n] = "o" end
      end
      for c, j in unicode.chars(OList) do
        if t[n] == c then t[n] = "O" end
      end
      for c, j in unicode.chars(eList) do
        if t[n] == c then t[n] = "e" end
      end
      for c, j in unicode.chars(EList) do
        if t[n] == c then t[n] = "E" end
      end
      for c, j in unicode.chars(iList) do
        if t[n] == c then t[n] = "i" end
      end
      for c, j in unicode.chars(IList) do
        if t[n] == c then t[n] = "I" end
      end
      for c, j in unicode.chars(uList) do
        if t[n] == c then t[n] = "u" end
      end
      for c, j in unicode.chars(UList) do
        if t[n] == c then t[n] = "U" end
      end
      for c, j in unicode.chars(yList) do
        if t[n] == c then t[n] = "y" end
      end
      for c, j in unicode.chars(YList) do
        if t[n] == c then t[n] = "Y" end
      end
      if t[n] == "Đ" then t[n] = "D" elseif t[n] == "đ" then t[n] = "d" end
      nline = nline .. t[n]
      n = n + 1
    end
  end
  text = nline
  return text
end

function remove_accents_v2(sub,sel)
  local aList = "áảàãạâấầẩậẫăắằẳẵặāǎ"
  local AList = "ÁẢÀÃẠÂẤẦẨẬẪĂẮẰẲẴẶĀǍ"
  local oList = "óòỏõọôốồổỗộơớờởỡợǒō"
  local OList = "ÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢǑŌ"
  local eList = "éèẻẽẹêếềểễệēě"
  local EList = "ÉÈẺẼẸÊẾỀỂỄỆĒĚ"
  local iList = "íìỉĩịīǐ"
  local IList = "ÍÌỈĨỊĪǏ"
  local uList = "úùủũụưứừửữựüūǔ"
  local UList = "ÚÙỦŨỤƯỨỪỬỮỰÜŪǓ"
  local yList = "ýỳỷỹỵ"
  local YList = "ÝỲỶỸỴ"

  for i, l in ipairs(sel) do
    local line = sub[l]
    local nline = ""
    local t = {}

    for c, i in unicode.chars(line.text) do
      table.insert(t, c)
    end

    local n = 1
    while (n <= #t) do
      if t[n] == "{" then
        while t[n] ~= "}" do
          nline = nline .. t[n]
          n = n + 1
        end
      else
        for c, j in unicode.chars(aList) do
          if t[n] == c then t[n] = "a" end
        end
        for c, j in unicode.chars(AList) do
          if t[n] == c then t[n] = "A" end
        end
        for c, j in unicode.chars(oList) do
          if t[n] == c then t[n] = "o" end
        end
        for c, j in unicode.chars(OList) do
          if t[n] == c then t[n] = "O" end
        end
        for c, j in unicode.chars(eList) do
          if t[n] == c then t[n] = "e" end
        end
        for c, j in unicode.chars(EList) do
          if t[n] == c then t[n] = "E" end
        end
        for c, j in unicode.chars(iList) do
          if t[n] == c then t[n] = "i" end
        end
        for c, j in unicode.chars(IList) do
          if t[n] == c then t[n] = "I" end
        end
        for c, j in unicode.chars(uList) do
          if t[n] == c then t[n] = "u" end
        end
        for c, j in unicode.chars(UList) do
          if t[n] == c then t[n] = "U" end
        end
        for c, j in unicode.chars(yList) do
          if t[n] == c then t[n] = "y" end
        end
        for c, j in unicode.chars(YList) do
          if t[n] == c then t[n] = "Y" end
        end
        if t[n] == "Đ" then t[n] = "D" elseif t[n] == "đ" then t[n] = "d" end
        nline = nline .. t[n]
        n = n + 1
      end
    end
    line.text = nline
    sub[l] = line
  end
end

function get_raw_v1(str)
  local t = {} -- full str
  for c, i in unicode.chars(str) do
    table.insert(t, c)
  end

  local p = {} --chars' position
  local n = 1
  while n <= #t do 
    if t[n] == "{" then
      while t[n] ~= "}" do
        n = n + 1
      end
      n = n + 1
    else
      table.insert(p, n)
      n = n + 1
    end
  end  
  return t, p
end

function get_raw_v2(str,choice)
  local t = {}; local p = {} --chars' position
  if choice == 1 then -- WORD
    local tchar = {} -- full str
    for c, i in unicode.chars(str) do
      table.insert(tchar, c)
    end

    local count = 0
    local n = 1
    local temp = ""
    while n <= #tchar do 
      if tchar[n] == "{" then
        while tchar[n] ~= "}" do
          temp = temp .. tchar[n]
          n = n + 1
        end
        temp = temp .. "}"
        table.insert(t,temp)
        temp = ""
        count = count + 1
        n = n + 1
      elseif tchar[n] == " " or tchar[n] == "*" then
        table.insert(t,tchar[n])
        count = count + 1
        table.insert(p,count)
        n = n + 1
      else       
        temp = temp .. tchar[n]
        n = n + 1
        if tchar[n] == "{" or tchar[n] == " " or tchar[n] == "*" or tchar[n] == nil then
          table.insert(t,temp)
          temp = ""
          count = count + 1
          table.insert(p,count)
        end
      end

    end  
  elseif choice == 0 then --CHAR
    for c, i in unicode.chars(str) do
      table.insert(t, c)
    end

    local n = 1
    while n <= #t do 
      if t[n] == "{" then
        while t[n] ~= "}" do
          n = n + 1
        end
        n = n + 1
      else
        table.insert(p, n)
        n = n + 1
      end
    end  
  end

  return t, p
end

function getToken(str,choice, block)
  local t = {}--token
  local p = {} --token position
  local tchar = {} --char table

  for c, i in unicode.chars(str) do
    table.insert(tchar, c)
  end

  local count = 0
  local n = 1
  local temp = ""

  if choice == 1 then --WORD
    if block == false then
      while n <= #tchar do 
        if tchar[n] == "{" then
          while tchar[n] ~= "}" do
            temp = temp .. tchar[n]
            n = n + 1
          end
          temp = temp .. "}"
          table.insert(t,temp)
          temp = ""
          count = count + 1
          n = n + 1
        elseif tchar[n] == " " or tchar[n] == "*" then
          table.insert(t,tchar[n])
          count = count + 1
          table.insert(p,count)
          n = n + 1
        else       
          temp = temp .. tchar[n]
          n = n + 1
          if tchar[n] == "{" or tchar[n] == " " or tchar[n] == "*" or tchar[n] == nil then
            table.insert(t,temp)
            temp = ""
            count = count + 1
            table.insert(p,count)
          end
        end
      end
    else
      while n <= #tchar do 
        if tchar[n] == " " or tchar[n] == "*" then
          table.insert(t,tchar[n])
          count = count + 1
          table.insert(p,count)
          n = n + 1
        elseif tchar[n] == "{" then
          while tchar[n] ~= "}" do
            temp = temp .. tchar[n]
            n = n + 1
          end
          if tchar[n] == "}" then
            temp = temp .. tchar[n]
            local m = n + 1
            if tchar[m] == " " or tchar[m] == "*" then
              n = n + 1
              while tchar[n] == " " or tchar[n] == "*" do
                temp = temp .. tchar[n]
                n = n + 1
              end
            else
              n = n + 1
            end
          end
          while tchar[n] ~= " " and tchar[n] ~= "{" and tchar[n] ~= "*" and tchar[n] ~= nil do
            temp = temp .. tchar[n]
            n = n + 1
            if tchar[n] == " " or tchar[n] == "{" or tchar[n] == "*" or tchar[n] == nil then
              table.insert(t,temp)
              temp = ""
              count = count + 1
              table.insert(p,count)
            end
          end
        else
          while tchar[n] ~= " " and tchar[n] ~= "{" and tchar[n] ~= "*" and tchar[n] ~= nil do
            temp = temp .. tchar[n]
            n = n + 1
            if tchar[n] == " " or tchar[n] == "{" or tchar[n] == "*" or tchar[n] == nil then
              table.insert(t,temp)
              temp = ""
              count = count + 1
              table.insert(p,count)
            end
          end
        end
      end 
    end 

  elseif choice == 0 then -- CHAR
    if block == false then
      t = tchar
      while n <= #tchar do 
        if tchar[n] == "{" then
          while tchar[n] ~= "}" do
            n = n + 1
          end
          n = n + 1
        else
          table.insert(p, n)
          n = n + 1
        end
      end    
    else --block == true    
      while n <= #tchar do 
        if tchar[n] == "{" then
          while tchar[n] ~= "}" do
            temp = temp .. tchar[n]
            n = n + 1
          end
          if tchar[n] == "}" then
            temp = temp .. tchar[n]
            local m = n + 1
            if tchar[m] == " " or tchar[m] == "*" then
              n = n + 1
              while tchar[n] == " " or tchar[n] == "*" do
                temp = temp .. tchar[n]
                n = n + 1
              end
            else
              n = n + 1
            end
            temp = temp .. tchar[n]
            table.insert(t, temp)
            temp = ""
            count = count + 1
            table.insert(p, count)
            n = n + 1
          end
        else
          table.insert(t, tchar[n])
          count = count + 1
          table.insert(p, count)
          n = n + 1
        end
      end
    end  
  end
  if block == true then
    local bl = {}
    for i, v in ipairs(p) do 
      if t[p[i]]:find("{.-}") then
        table.insert(bl,t[p[i]]:match("{.-}"))
      else
        table.insert(bl,"")
      end
--      end
    end
    for i, v in ipairs(p) do --DELETE BLOCKS IN t
      if bl[i] ~= "" then
        t[v] = t[v]:gsub("{.-}","")
      end
    end
    return t, p, bl
  else
    return t, p
  end
end

function add_accents_v1(new,old) -- parameters are strings
  local pNew = {}
  tNew, pNew = get_raw_v1(new)
  local pOld = {}
  tOld, pOld = get_raw_v1(old)
  local nText = ""
  local oText = ""
  for i, p in ipairs(pNew) do
    nText = nText .. tNew[p]
  end

  for i, p in ipairs(pOld) do
    oText = oText .. tOld[p]
  end

  if (#pOld ~= #pNew) then
    aegisub.debug.out("Failed to add accents: Two lines of text must have the same pattern.\n")
    aegisub.debug.out("Line 1: " .. nText .. "\n")
    aegisub.debug.out("Line 2: " .. oText .. "\n")
    aegisub.debug.out("Please edit one of two lines.")
  else
    for i, o in ipairs(pOld) do
      if tNew[pNew[i]] ~= tOld[o] then
        tOld[o] = tNew[pNew[i]]
      end
    end
  end

  local res = ""
  for i, c in ipairs(tOld) do
    res = res .. c 
  end
  return res
end

--convert original path to aegisub's legal path
function ass_path(path)
  return string.gsub(path, "\\", "/")
end

--draw mask for image/logo
function drawRect(w,h)
return string.format("m 0 0 l %s 0 %s %s 0 %s", w, w, h, h)
end

function shuffle(table)
  math.randomseed(os.time())
  for i = #table, 2, -1 do
    local j = math.random(i)
    table[i], table[j] = table[j], table[i]
  end
end